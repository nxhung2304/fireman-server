# Services Refactoring Plan

## Overview

This document outlines a comprehensive refactoring plan to transform the current services architecture into a scalable, maintainable, and testable system following SOLID principles.

## Rules
- All code files will be in app/services
- Easy maintainable and easy to understand code

## Current Issues Analysis

### SOLID Violations

#### Single Responsibility Principle (SRP) Violations:
- **Datasource classes** handle both API calls AND Slack formatting
- **Fireman classes** mix business logic with Slack integration  
- **Analytics::Aggregator** depends on specific data structure

#### Dependency Inversion Principle (DIP) Violations:
- `Fireman::Gold` directly instantiates datasource classes
- `Analytics::Summary` depends on specific HuggingFace implementation
- Hardcoded Slack integration throughout

#### Missing Abstractions:
- No common interface for datasources
- No strategy pattern for output formatters
- No dependency injection

### Current Testing Problems:
- Tight coupling makes unit testing difficult
- External API dependencies make tests flaky
- No way to test individual components in isolation

## Proposed Modular Architecture

### Directory Structure
```
app/services/
├── data_sources/
│   ├── base_data_source.rb          # Abstract base
│   ├── news_sources/
│   │   ├── news_api_source.rb       # Only API calls
│   │   └── the_news_api_source.rb   # Only API calls
│   └── price_sources/
│       ├── sjc_gold_source.rb       # Only web scraping
│       └── world_gold_source.rb     # Only web scraping
├── processors/
│   ├── base_processor.rb            # Abstract base
│   ├── news_processors/
│   │   ├── news_aggregator.rb       # Aggregate multiple sources
│   │   └── news_summarizer.rb       # Summarize content
│   └── price_processors/
│       ├── gold_formatter.rb        # Format gold data
│       └── price_calculator.rb      # Calculate changes/averages
├── outputs/
│   ├── base_output.rb               # Abstract base
│   ├── formatters/
│   │   ├── slack_formatter.rb       # Slack block formatting
│   │   └── json_formatter.rb        # JSON formatting
│   └── deliverers/
│       ├── slack_deliverer.rb       # Slack delivery
│       └── webhook_deliverer.rb     # Webhook delivery
├── services/
│   ├── base_service.rb              # Abstract base
│   ├── news_service.rb              # News business logic
│   ├── gold_service.rb              # Gold business logic
│   └── crypto_service.rb            # Crypto business logic
└── infrastructure/
    ├── http_client.rb               # Faraday wrapper
    ├── web_scraper.rb               # Nokogiri wrapper
    ├── configuration.rb             # App configuration
    ├── logger.rb                    # Centralized logging
    └── container.rb                 # DI container
```

## Base Interfaces

### BaseDataSource Interface
```ruby
# app/services/data_sources/base_data_source.rb
module DataSources
  class BaseDataSource
    # Public interface
    def call(params = {})
      raise NotImplementedError, "Subclass must implement #call"
    end

    # Common utility methods
    def success?
      result.success?
    end

    def data
      result.data
    end

    def error
      result.error
    end

    protected

    def result
      @result ||= Result.new
    end

    def http_client
      @http_client ||= Infrastructure::HttpClient.new
    end
  end

  # Result object for consistent return values
  class Result
    attr_reader :data, :error

    def initialize(data: nil, error: nil)
      @data = data
      @error = error
    end

    def success?
      error.nil?
    end

    def failure?
      !success?
    end
  end
end
```

### BaseProcessor Interface
```ruby
# app/services/processors/base_processor.rb
module Processors
  class BaseProcessor
    def call(input_data)
      raise NotImplementedError, "Subclass must implement #call"
    end

    def success?
      result.success?
    end

    def processed_data
      result.data
    end

    def error
      result.error
    end

    protected

    def result
      @result ||= Processors::Result.new
    end
  end

  class Result < DataSources::Result; end
end
```

### BaseOutput Interface
```ruby
# app/services/outputs/base_output.rb
module Outputs
  class BaseOutput
    def initialize(target:, formatter: nil)
      @target = target
      @formatter = formatter || default_formatter
    end

    def deliver(data)
      formatted_data = @formatter.format(data)
      send_to_target(formatted_data)
    end

    protected

    def send_to_target(formatted_data)
      raise NotImplementedError, "Subclass must implement #send_to_target"
    end

    def default_formatter
      raise NotImplementedError, "Subclass must implement #default_formatter"
    end
  end
end
```

## Example Data Source Implementation

### Refactored News API Source
```ruby
# app/services/data_sources/news_sources/news_api_source.rb
module DataSources
  module NewsSources
    class NewsApiSource < BaseDataSource
      MAXIMUM_RESULT = 3
      BASE_URL = "https://newsapi.org"
      ENDPOINT = "/v2/everything"

      def initialize(api_token: nil, http_client: nil)
        @api_token = api_token || ENV["NEWSAPI_TOKEN"]
        @http_client = http_client || Infrastructure::HttpClient.new
      end

      def call(query)
        validate_input!(query)
        
        response = make_api_request(query)
        handle_response(response)
        
        self
      rescue StandardError => e
        @result = Result.new(error: e.message)
        self
      end

      private

      def validate_input!(query)
        raise ArgumentError, "Query cannot be blank" if query.blank?
        raise ArgumentError, "API token is required" if @api_token.blank?
      end

      def make_api_request(query)
        params = build_params(query)
        headers = { "X-Api-Key" => @api_token }
        
        @http_client.get("#{BASE_URL}#{ENDPOINT}", params: params, headers: headers)
      end

      def build_params(query)
        {
          q: query,
          language: "en",
          from: yesterday_formatted,
          to: today_formatted,
          pageSize: MAXIMUM_RESULT
        }
      end

      def yesterday_formatted
        Date.yesterday.strftime("%Y-%m-%d")
      end

      def today_formatted
        Date.current.strftime("%Y-%m-%d")
      end

      def handle_response(response)
        if response.success?
          parsed_data = JSON.parse(response.body)
          @result = Result.new(data: parsed_data["articles"] || [])
        else
          @result = Result.new(error: "API error: #{response.status}")
        end
      end
    end
  end
end
```

### Refactored SJC Gold Source
```ruby
# app/services/data_sources/price_sources/sjc_gold_source.rb
module DataSources
  module PriceSources
    class SjcGoldSource < BaseDataSource
      URL = "https://www.24h.com.vn/gia-vang-hom-nay-c425.html"

      def initialize(url: URL, scraper: nil)
        @url = url
        @scraper = scraper || Infrastructure::WebScraper.new
      end

      def call(params = {})
        document = @scraper.fetch(@url)
        gold_data = extract_sjc_data(document)
        
        @result = Result.new(data: gold_data)
        self
      rescue StandardError => e
        @result = Result.new(error: e.message)
        self
      end

      private

      def extract_sjc_data(document)
        gold_rows = document.css("table tr")
        sjc_row = gold_rows.find { |row| row.css("h2").text.strip == "SJC" }
        
        return {} unless sjc_row
        
        {
          provider: "SJC",
          buy_today: extract_value(sjc_row, "td:nth-child(2) span.fixW"),
          sell_today: extract_value(sjc_row, "td:nth-child(3) span.fixW"),
          buy_yesterday: extract_value(sjc_row, "td:nth-child(4)"),
          sell_yesterday: extract_value(sjc_row, "td:nth-child(5)")
        }
      end

      def extract_value(row, selector)
        row.css(selector).text.strip
      end
    end
  end
end
```

## Service Orchestration Flow

### Gold Service Example
```ruby
# app/services/services/gold_service.rb
module Services
  class GoldService < BaseService
    def initialize(sources:, processor:, output:)
      @sources = sources      # [SjcGoldSource, WorldGoldSource]
      @processor = processor  # GoldFormatter
      @output = output        # SlackOutput
    end

    def execute(params = {})
      # 1. Collect data from multiple sources
      raw_data = collect_data_from_sources
      
      # 2. Process/format the data
      processed_data = @processor.call(raw_data)
      
      # 3. Deliver to output
      @output.deliver(processed_data.processed_data) if processed_data.success?
      
      # 4. Return result
      build_result(raw_data, processed_data)
    end

    private

    def collect_data_from_sources
      results = []
      
      @sources.each do |source|
        result = source.call
        results << {
          source: source.class.name,
          data: result.data,
          success: result.success?,
          error: result.error
        }
      end
      
      results
    end

    def build_result(raw_data, processed_data)
      {
        sources_data: raw_data,
        processed_data: processed_data.processed_data,
        success: processed_data.success?,
        errors: collect_errors(raw_data)
      }
    end

    def collect_errors(raw_data)
      raw_data.select { |r| r[:error] }.map { |r| r[:error] }
    end
  end
end
```

### News Service Example
```ruby
# app/services/services/news_service.rb
module Services
  class NewsService < BaseService
    def initialize(sources:, processor:, output:, summarizer: nil)
      @sources = sources
      @processor = processor
      @output = output
      @summarizer = summarizer  # Optional summarization
    end

    def execute(query)
      # 1. Collect news from multiple sources
      articles = []
      @sources.each do |source|
        result = source.call(query)
        articles.concat(result.data) if result.success?
      end
      
      # 2. Process and optionally summarize
      processed_data = @processor.call(articles)
      
      if @summarizer && processed_data.success?
        summarized_data = @summarizer.call(processed_data.processed_data)
        processed_data = summarized_data if summarized_data.success?
      end
      
      # 3. Deliver output
      @output.deliver(processed_data.processed_data) if processed_data.success?
      
      processed_data
    end
  end
end
```

### Data Flow Visualization
```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐    ┌──────────────┐
│  GoldService    │───▶│  SjcGoldSource   │───▶│  GoldFormatter  │───▶│ SlackOutput  │
│                 │    │  WorldGoldSource │    │                 │    │              │
└─────────────────┘    └──────────────────┘    └─────────────────┘    └──────────────┘
        │                       │                       │                       │
        ▼                       ▼                       ▼                       ▼
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐    ┌──────────────┐
│ NewsService     │───▶│  NewsApiSource   │───▶│ NewsAggregator  │───▶│ SlackOutput  │
│                 │    │  TheNewsApiSource│    │ NewsSummarizer  │    │              │
└─────────────────┘    └──────────────────┘    └─────────────────┘    └──────────────┘
```

## Dependency Injection Container Setup

### Simple DI Container
```ruby
# app/services/infrastructure/container.rb
module Infrastructure
  class Container
    def initialize
      @services = {}
      @singletons = {}
    end

    def register(name, factory = nil, options = {}, &block)
      factory ||= block
      @services[name] = { factory: factory, singleton: options[:singleton] || false }
    end

    def resolve(name)
      service = @services[name]
      raise ServiceNotRegisteredError, "Service '#{name}' not registered" unless service

      if service[:singleton]
        @singletons[name] ||= service[:factory].call
      else
        service[:factory].call
      end
    end

    def clear
      @singletons.clear
    end
  end

  class ServiceNotRegisteredError < StandardError; end
end
```

### Application Configuration
```ruby
# config/services.rb
class ServiceConfiguration
  def self.configure(container)
    # Infrastructure services
    container.register(:http_client, -> { Infrastructure::HttpClient.new }, singleton: true)
    container.register(:web_scraper, -> { Infrastructure::WebScraper.new }, singleton: true)
    
    # Data sources
    container.register(:news_sources, -> {
      [
        DataSources::NewsSources::NewsApiSource.new,
        DataSources::NewsSources::TheNewsApiSource.new
      ]
    })
    
    container.register(:gold_sources, -> {
      [
        DataSources::PriceSources::SjcGoldSource.new,
        DataSources::PriceSources::WorldGoldSource.new
      ]
    })
    
    # Processors
    container.register(:news_processor, -> { Processors::NewsProcessor.new })
    container.register(:news_summarizer, -> { Processors::NewsSummarizer.new })
    container.register(:gold_formatter, -> { Processors::GoldFormatter.new })
    
    # Outputs
    container.register(:slack_news_output, -> {
      Outputs::SlackOutput.new(
        target: "#fireman-news",
        formatter: Outputs::Formatters::SlackFormatter.new
      )
    })
    
    container.register(:slack_gold_output, -> {
      Outputs::SlackOutput.new(
        target: "#fireman-gold", 
        formatter: Outputs::Formatters::GoldSlackFormatter.new
      )
    })
    
    # Business services
    container.register(:news_service, -> {
      Services::NewsService.new(
        sources: container.resolve(:news_sources),
        processor: container.resolve(:news_processor),
        output: container.resolve(:slack_news_output),
        summarizer: container.resolve(:news_summarizer)
      )
    })
    
    container.register(:gold_service, -> {
      Services::GoldService.new(
        sources: container.resolve(:gold_sources),
        processor: container.resolve(:gold_formatter),
        output: container.resolve(:slack_gold_output)
      )
    })
  end
end
```

### Application Bootstrap
```ruby
# config/application.rb
class Application
  def self.container
    @container ||= Infrastructure::Container.new
  end

  def self.configure!
    ServiceConfiguration.configure(container)
  end

  def self.start_services
    configure!
    
    # Example usage
    news_service = container.resolve(:news_service)
    gold_service = container.resolve(:gold_service)
    
    # Execute services
    news_service.execute("bitcoin")
    gold_service.execute
  end
end
```

### Usage in Rails Console/Controller
```ruby
# In Rails controller
class NewsController < ApplicationController
  def create
    news_service = Application.container.resolve(:news_service)
    result = news_service.execute(params[:query])
    
    render json: { success: result.success?, data: result.processed_data }
  end
end

# In Rails console (for testing)
irb> Application.start_services
# or
irb> news_service = Application.container.resolve(:news_service)
irb> news_service.execute("cryptocurrency")
```

## Complete Data Flow Example

### Real Gold Service Execution Flow:
```ruby
# 1. Service instantiation
gold_service = Application.container.resolve(:gold_service)

# 2. Data Collection
sjc_source = DataSources::PriceSources::SjcGoldSource.new
world_source = DataSources::PriceSources::WorldGoldSource.new

sjc_result = sjc_source.call
# => Result<success: true, data: {provider: "SJC", buy_today: "5.620.000", ...}>

world_result = world_source.call  
# => Result<success: true, data: {spot_price: "1,823.45 USD/Ounce", ...}>

# 3. Data Processing
formatter = Processors::GoldFormatter.new
processed = formatter.call([sjc_result.data, world_result.data])
# => Result<success: true, data: [slack_blocks...]>

# 4. Output Delivery
slack_output = Outputs::SlackOutput.new(target: "#fireman-gold")
slack_output.deliver(processed.data)
# => Posts formatted blocks to Slack channel
```

## Testing Strategy

### Unit Tests with Mocks
```ruby
# Test data sources independently
RSpec.describe NewsApiSource do
  it "fetches news from API" do
    http_client = double("HttpClient")
    allow(http_client).to receive(:get).and_return(mock_response)
    
    source = NewsApiSource.new(http_client: http_client)
    result = source.call("bitcoin")
    
    expect(result.success?).to be true
  end
end
```

### Integration Tests with Test Doubles
```ruby
# Test service orchestration
RSpec.describe NewsService do
  it "processes and delivers news" do
    mock_source = double("DataSource", call: mock_data)
    mock_processor = double("Processor", process: processed_data)
    mock_output = double("Output", deliver: true)
    
    service = NewsService.new(
      sources: [mock_source],
      processors: [mock_processor],
      outputs: [mock_output]
    )
    
    service.execute
    expect(mock_output).to have_received(:deliver).with(processed_data)
  end
end
```

### Contract Tests for External APIs
```ruby
# Test API contracts without hitting real APIs
RSpec.describe "News API Contract" do
  it "returns expected structure" do
    stub_request(:get, /newsapi.org/)
      .to_return(body: fixture_response)
    
    source = NewsApiSource.new
    result = source.call("test")
    
    expect(result.data).to have_key(:articles)
  end
end
```

## Benefits of Refactored Architecture

### Scalability:
- **Easy to add new data sources** - Just implement `BaseDataSource`
- **Simple to add new outputs** - Implement `BaseOutput` interface
- **Composable processors** - Chain multiple processors as needed

### Maintainability:
- **Single responsibility** - Each class has one clear purpose
- **Dependency injection** - Easy to swap implementations
- **Clear separation** - Business logic separated from infrastructure

### Testability:
- **Isolated components** - Test each part independently
- **Mock-friendly** - Clear interfaces for test doubles
- **Fast unit tests** - No external dependencies in unit tests

### Error Handling:
- **Centralized error handling** - Base classes provide consistent error patterns
- **Graceful degradation** - Can fail individual components without breaking entire flow

### Configuration Management:
- **Environment-based configuration** - Different configs for dev/staging/prod
- **Service registration** - Easy to enable/disable features per environment

## Refactoring Implementation Phases

### Phase 1: Create Abstractions & Interfaces
1. Create `BaseDataSource` with common interface
2. Create `BaseProcessor` with interface
3. Create `BaseOutput` with interface
4. Create `Result` objects for consistent return values

### Phase 2: Extract Single Responsibilities
1. **Separate API calls from formatting** - Move web scraping logic out of current datasource classes
2. **Create dedicated formatters** - Extract Slack formatting from datasources
3. **Implement dependency injection** - Use factory pattern for service instantiation

### Phase 3: Implement Dependency Injection
1. Create DI container
2. Register all services
3. Update existing services to use DI
4. Create configuration files

### Phase 4: Migrate Existing Services
1. Refactor `Fireman::Gold` to new `GoldService`
2. Refactor `Fireman::News` to new `NewsService`
3. Refactor `Fireman::Crypto` to new `CryptoService`
4. Remove old implementation after testing

### Phase 5: Add Comprehensive Tests
1. Unit tests for each component
2. Integration tests for service orchestration
3. Contract tests for external APIs
4. End-to-end tests for complete flows

This refactoring plan provides a clear path from the current tightly-coupled architecture to a clean, scalable, and maintainable system that follows SOLID principles and is easy to test.

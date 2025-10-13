# Refactored Services Architecture

This directory contains the refactored service architecture following SOLID principles and implementing a clean, modular design.

## Architecture Overview

The new architecture separates concerns into distinct layers:

### 1. Infrastructure Layer (`infrastructure/`)
- **HttpClient**: Wrapper for HTTP requests (Faraday)
- **WebScraper**: Wrapper for web scraping (Nokogiri)
- **Container**: Dependency injection container
- **Configuration**: Centralized configuration management
- **Logger**: Centralized logging service

### 2. Data Sources Layer (`data_sources/`)
- **BaseDataSource**: Abstract base class for all data sources
- **News Sources**: NewsApiSource, TheNewsApiSource
- **Price Sources**: SjcGoldSource, WorldGoldSource

### 3. Processors Layer (`processors/`)
- **BaseProcessor**: Abstract base class for all processors
- **News Processors**: NewsAggregator, NewsSummarizer
- **Price Processors**: GoldFormatter

### 4. Outputs Layer (`outputs/`)
- **BaseOutput**: Abstract base class for all outputs
- **Formatters**: SlackFormatter, GoldSlackFormatter
- **Deliverers**: SlackDeliverer
- **Complete Outputs**: SlackOutput, GoldSlackOutput

### 5. Services Layer (root level)
- **BaseService**: Abstract base class for business services
- **NewsService**: News business logic orchestration
- **GoldService**: Gold price business logic orchestration

## Usage Examples

### Using the Service Container

```ruby
# Configure and start services
ServiceContainer.start_services

# Fetch news
result = ServiceContainer.fetch_news("bitcoin")
puts result[:success] ? "Success" : "Failed"

# Fetch gold prices
result = ServiceContainer.fetch_gold_prices
puts result[:success] ? "Success" : "Failed"
```

### Direct Service Usage

```ruby
# Get specific services
news_service = ServiceContainer.news_service
gold_service = ServiceContainer.gold_service

# Execute with custom parameters
news_service.execute("cryptocurrency")
gold_service.execute
```

### Legacy Compatibility

The old `Fireman::News` and `Fireman::Gold` classes still work but show deprecation warnings:

```ruby
# Old way (deprecated)
news = Fireman::News.new
news.send_news("bitcoin")

gold = Fireman::Gold.new
gold.call
```

## Configuration

Environment variables:
- `NEWSAPI_TOKEN`: News API token
- `THE_NEWS_API_TOKEN`: The News API token
- `SLACK_WEBHOOK_URL`: Slack webhook URL
- `HUGGING_FACE_TOKEN`: Hugging Face API token for summarization

Or use `config/services.yml` for environment-specific configuration.

## Adding New Services

### 1. Create a new data source

```ruby
module DataSources
  module CustomSources
    class MySource < BaseDataSource
      def call(params = {})
        # Implementation
      end
    end
  end
end
```

### 2. Create a processor if needed

```ruby
module Processors
  module CustomProcessors
    class MyProcessor < BaseProcessor
      def call(input_data)
        # Processing logic
      end
    end
  end
end
```

### 3. Register in DI container

```ruby
# In config/services.rb
container.factory(:my_source) { DataSources::CustomSources::MySource.new }
container.factory(:my_processor) { Processors::CustomProcessors::MyProcessor.new }

container.factory(:my_service) do
  Services::MyService.new(
    sources: [container.resolve(:my_source)],
    processor: container.resolve(:my_processor),
    output: container.resolve(:slack_output)
  )
end
```

## Testing

The architecture supports easy testing with dependency injection:

```ruby
# Configure test environment
ServiceContainer.configure_for_testing!

# Or create custom test doubles
test_container = Infrastructure::Container.new
test_container.register(:http_client, -> { MockHttpClient.new })
# ... configure other test doubles
```

## Migration Path

1. **Phase 1**: Start using `ServiceContainer.fetch_news()` and `ServiceContainer.fetch_gold_prices()`
2. **Phase 2**: Gradually migrate to using specific services directly
3. **Phase 3**: Remove legacy `Fireman::News` and `Fireman::Gold` classes

## Benefits

- **Single Responsibility**: Each class has one clear purpose
- **Dependency Injection**: Easy to test and swap implementations
- **Modular Design**: Easy to add new data sources and outputs
- **Error Handling**: Centralized error handling and logging
- **Configuration**: Environment-based configuration management
- **Scalability**: Easy to extend and maintain
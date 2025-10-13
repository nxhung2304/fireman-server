# Simple Services Architecture

This is a much simpler approach to services that's easy to read and understand.

## 📁 What We Have

### Core Services
- **`GoldService`** - Fetches gold prices from SJC and world markets
- **`NewsService`** - Fetches news from News API
- **`Services`** - Simple service container module

### Usage

```ruby
# Fetch gold prices and send to Slack (one step)
result = Services.notify_gold_prices

# Fetch news and send to Slack (one step)
result = Services.notify_news("bitcoin")

# Or separate fetch and send for more control
prices = Services.fetch_gold_prices     # Just fetch
Services.send_gold_prices(prices)      # Just send

news = Services.fetch_news("crypto")    # Just fetch  
Services.send_news(news)                # Just send

# Get service instances directly
gold_service = Services.gold
news_service = Services.news
```

### Legacy Support

Old `Fireman::Gold` and `Fireman::News` classes still work but show deprecation warnings:

```ruby
# Old way (still works)
Fireman::Gold.new.call
Fireman::News.new.send_news("crypto")
```

## 🎯 Why This is Better

1. **Simple to read** - Each service does one thing clearly
2. **No complex abstractions** - Direct API calls and Slack messages
3. **Easy to modify** - All logic in one place per service
4. **No dependency injection complexity** - Just instantiate what you need
5. **Works with Rails autoloading** - No complex require statements

## 📁 File Structure

```
app/services/
├── gold_service.rb      # Simple gold price service
├── news_service.rb      # Simple news service  
├── services.rb          # Service container module
└── fireman/             # Legacy classes (deprecated)
    ├── gold.rb
    └── news.rb
```

## 🔧 Configuration

Environment variables needed:
- `NEWSAPI_TOKEN` - News API key
- `SLACK_WEBHOOK_URL` - Slack webhook URL (for SlackBot)

## 🚀 Adding New Services

Just create a new class in `app/services/`:

```ruby
class CryptoService
  def fetch_and_send_prices
    # Your logic here
  end
end

# Add to Services module
module Services
  def self.crypto
    @crypto_service ||= CryptoService.new
  end
end
```

That's it! No complex DI containers or abstract base classes needed.
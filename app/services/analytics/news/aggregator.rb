module Analytics
  module News
    class Aggregator
      def self.call(articles_topic)
        summarizer = Datasource::Analytic::Summary.new
        summaries = []

        articles_topic.each do |article|
          summary_result = summarizer.call(article["content"] || article["description"])
          summaries << {
            title: article["title"],
            summary: summary_result[:summary],
            url: article["url"],
            source: article["source"]["name"]
          }
        end

        { summaries: summaries, success: true }
      end
    end
  end
end

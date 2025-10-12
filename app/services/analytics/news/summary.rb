module  Analytics
  module News
    class Summary
      def call(text)
        token = ENV["HUGGING_FACE_TOKEN"]
        client = HuggingFace::InferenceApi.new(api_token: token)

        begin
        result = client.summarization(input: text)
        { summary: result, success: true }
      rescue => e
        { summary: nil, error: e.message, success: false }
      end
      end
    end
  end
end

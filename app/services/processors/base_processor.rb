module Processors
  class BaseProcessor
    def call
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
      @result ||= Result.new
    end
  end
end

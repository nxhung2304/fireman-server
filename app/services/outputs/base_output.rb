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

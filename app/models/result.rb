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

class ApplicationDecorator

  attr_reader :model, :options

  def initialize(model, options = {})
    @model = model
    @options = options
  end

  def method_missing(method, *args, &block)
    if model.respond_to?(method, *args, &block)
      model.send(method, *args, &block)
    else
      super
    end
  end

  def respond_to?(method, *args, &block)
    model.respond_to?(method, *args, &block) || super
  end
end

class TokenizerDecorator

  attr_reader :tokenizer

  def initialize(tokenizer)
    @tokenizer = tokenizer
  end

  def each
    tokenizer.each do |token|
      yield "[#{token}]"
    end
  end

  def method_missing(method, *args, &block)
    if tokenizer.respond_to?(method, *args, &block)
      tokenizer.send(method, *args, &block)
    else
      super
    end
  end

  def respond_to?(method, *args, &block)
    tokenizer.respond_to?(method, *args, &block) || super
  end
end

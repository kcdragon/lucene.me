class AnalyzerDecorator

  attr_reader :analyzer, :options

  def initialize(analyzer, options)
    @analyzer = analyzer
    @options = options
  end

  def tokenizer
    analyzer.tokenize(options[:text])
  end

  def each
    tokenizer.each do |token|
      yield "[#{token}]"
    end
  end

  def method_missing(method, *args, &block)
    if analyzer.respond_to?(method, *args, &block)
      analyzer.send(method, *args, &block)
    else
      super
    end
  end

  def respond_to?(method, *args, &block)
    analyzer.respond_to?(method, *args, &block) || super
  end
end

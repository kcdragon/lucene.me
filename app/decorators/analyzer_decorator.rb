class AnalyzerDecorator < ApplicationDecorator

  def each
    tokenizer.each do |token|
      yield "[#{token}]"
    end
  end

  def tokenizer
    model.tokenize(options[:text])
  end
end

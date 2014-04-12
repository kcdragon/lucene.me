class Tokenizer
  include Enumerable

  attr_reader :analyzer, :text

  def initialize(analyzer, text)
    @analyzer = analyzer
    @text = text
  end

  def each
    token_stream.reset

    while token_stream.increment_token
      start_offset = @offset_attribute.start_offset
      end_offset = @offset_attribute.end_offset
      term = @char_term_attribute.to_string
      yield term
    end

    token_stream.close
  end

  private

  def token_stream
    return @token_stream if defined?(@token_stream)

    @token_stream = analyzer.token_stream('test', text)
    @offset_attribute = token_stream.add_attribute(OffsetAttribute.java_class)
    @char_term_attribute = token_stream.add_attribute(CharTermAttribute.java_class)

    @token_stream
  end
end

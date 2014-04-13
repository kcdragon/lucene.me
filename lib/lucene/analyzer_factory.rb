class Lucene::AnalyzerFactory

  VERSION = Version::LUCENE_47

  attr_reader :analyzer_id

  def initialize(analyzer_id)
    @analyzer_id = analyzer_id
  end

  def build
    case analyzer_id
    when 'simple'
      SimpleAnalyzer.new(VERSION)
    when 'snowball'
      SnowballAnalyzer.new(VERSION, 'English')
    when 'standard'
      StandardAnalyzer.new(VERSION)
    when 'stop'
      StopAnalyzer.new(VERSION)
    when 'whitespace'
      WhitespaceAnalyzer.new(VERSION)
    end
  end
end

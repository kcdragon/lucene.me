class Analyzer

  VERSION = Version::LUCENE_47

  cattr_accessor :built_in_analyzers
  self.built_in_analyzers = {
    'whitespace' => WhitespaceAnalyzer,
    'simple' => SimpleAnalyzer,
    'stop' => StopAnalyzer,
    'standard' => StandardAnalyzer
  }

  def self.all
    built_in_analyzers.values.map do |klass|
      klass.new(VERSION)
    end
  end

  def self.find(analyzer_id)
    built_in_analyzers[analyzer_id].new(VERSION)
  end
end

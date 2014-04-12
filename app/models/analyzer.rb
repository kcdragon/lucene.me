class Analyzer
  include ActiveModel::Model

  attr_accessor :id, :name, :analyzer

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
    new(analyzer: built_in_analyzers[analyzer_id].new(VERSION), name: analyzer_id.titleize)
  end

  # @return [Enumerable]
  #
  def tokenize(text)
    Tokenizer.new(analyzer, text)
  end
end

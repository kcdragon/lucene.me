require 'spec_helper'

describe Analyzer do

  describe '.find' do
    it 'finds supported analyzers' do
      id = 'whitespace'
      analyzer = Analyzer.find(id)

      analyzer.name.should == 'Whitespace'
      analyzer.analyzer.should be_kind_of WhitespaceAnalyzer
    end
  end

  describe '#tokenize' do
    it 'returns token strings' do
      analyzer = Analyzer.new(analyzer: WhitespaceAnalyzer.new(Version::LUCENE_47))
      tokens = analyzer.tokenize('foo bar').to_a
      tokens.should == ['foo', 'bar']
    end
  end
end

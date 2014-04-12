require 'spec_helper'

describe Analyzer do

  describe '#name' do
    it do
      analyzer = Analyzer.new(name: 'Standard')
      analyzer.name.should == 'Standard'
    end
  end

  describe '#tokenize' do
    it 'returns token strings' do
      analyzer = Analyzer.new(analyzer: WhitespaceAnalyzer.new(Analyzer::VERSION))
      tokens = analyzer.tokenize('foo bar').to_a
      tokens.should == ['foo', 'bar']
    end
  end
end

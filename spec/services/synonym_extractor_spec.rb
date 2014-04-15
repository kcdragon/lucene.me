require 'spec_helper'

describe SynonymExtractor do

  it 'returns tokenized text with synonyms included' do
    synonyms = 'foo, bar'
    text = 'foo'
    extractor = SynonymExtractor.new(synonyms, text)
    extractor.tokens.should match_array %w(foo bar)
  end
end

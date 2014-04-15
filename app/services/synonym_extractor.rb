class SynonymExtractor

  class SynonymAnalyzer
    java_implements 'org.apache.lucene.analysis.Analyzer'

    attr_accessor :synonym_map

    java_signature 'TokenStream tokenStream(String, Reader)'
    def token_stream(field_name, reader)
      tokenizer = StandardTokenizer.new(Version::LUCENE_47, StringReader.new(reader))
      SynonymFilter.new(tokenizer, synonym_map, true)
    end
  end

  attr_reader :synonyms, :text

  def initialize(synonyms, text)
    @synonyms, @text = synonyms, text
  end

  def tokens
    reader = StringReader.new(synonyms)
    parser.parse(reader)
    synonym_map = parser.build

    analyzer = SynonymAnalyzer.new
    analyzer.synonym_map = synonym_map

    Lucene::Tokenizer.new(analyzer, text).to_a
  end

  def parser
    return @parser if defined?(@parser)

    dedup = false
    expand = true
    @parser = SolrSynonymParser.new(dedup, expand, analyzer)
  end

  def analyzer
    Lucene::AnalyzerFactory.new('simple').build
  end
end

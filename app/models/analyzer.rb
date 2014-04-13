class Analyzer
  include ActiveModel::Model

  attr_accessor :id, :name, :description, :analyzer

  class << self
    def all
      cache.values
    end

    def find(analyzer_id)
      cache[analyzer_id]
    end

    private

    def cache
      return @cache if defined?(@cache)

      config = YAML.load_file(Rails.root.join('data', 'analyzers.yml'))
      @cache = config['analyzers'].each_with_object({}) do |(analyzer_id, details), memo|
        analyzer = Lucene::AnalyzerFactory.new(analyzer_id).build

        name = details['name']
        description = details['description']

        memo[analyzer_id] = new(id: analyzer_id, name: name, description: description, analyzer: analyzer)
      end
    end
  end

  # @return [Enumerable]
  #
  def tokenize(text)
    Lucene::Tokenizer.new(analyzer, text)
  end
end

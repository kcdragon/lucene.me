module AnalyzerHelper

  def analyzer_options
    Analyzer.built_in_analyzers.keys.map do |analyzer|
      [analyzer.titleize, analyzer]
    end
  end
end

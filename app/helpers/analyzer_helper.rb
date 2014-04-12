module AnalyzerHelper

  def analyzer_ids
    Analyzer.built_in_analyzers.keys
  end
end

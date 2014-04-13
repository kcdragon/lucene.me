class AnalyzersController < ApplicationController

  helper_method :selected_analyzer_ids
  helper_method :all_analyzer_ids

  def index
    if params[:text].blank?
      @analyzers = []
      render :index and return
    end

    @analyzers = selected_analyzer_ids.map do |analyzer_id|
      analyzer = Analyzer.find(analyzer_id)
      AnalyzerDecorator.new(analyzer, text: text)
    end
  end

  private

  def text
    params[:text]
  end

  def selected_analyzer_ids
    params[:analyzer_ids] || []
  end

  def all_analyzer_ids
    Analyzer.built_in_analyzers.keys
  end
end

class AnalyzersController < ApplicationController

  def index
    if params[:text].blank?
      @analyzers = []
      render :index and return
    end

    @analyzers = analyzers.map do |analyzer|
      analyzer = Analyzer.find(analyzer)
      AnalyzerDecorator.new(analyzer, text: text)
    end
  end

  def analyzers
    params[:analyzers] || []
  end

  def text
    params[:text]
  end
end

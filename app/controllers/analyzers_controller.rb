class AnalyzersController < ApplicationController

  def index
    if params[:text].blank?
      @tokenizer = []
      render :index and return
    end

    analyzer = Analyzer.find(params[:analyzer])
    text = params[:text]

    tokenizer = Tokenizer.new(analyzer, text)
    @tokenizer = TokenizerDecorator.new(tokenizer)
  end
end

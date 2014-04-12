class AnalyzersController < ApplicationController

  def index
    if params[:text].blank?
      @tokenizer = []
      render :index and return
    end

    version = Version::LUCENE_47
    analyzer = WhitespaceAnalyzer.new(version)
    text = params[:text]

    @tokenizer = TokenizerDecorator.new(Tokenizer.new(analyzer, text))
  end
end

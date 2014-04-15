class SynonymsController < ApplicationController

  def index
    if params[:synonyms].blank? || params[:text].blank?
      @tokens = []
      render :index and return
    end

    @tokens = SynonymExtractor.new(params[:synonyms], params[:text]).tokens
  end
end

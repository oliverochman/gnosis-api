class Api::V0::ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: articles, each_serializer: Articles::IndexSerializer
  end

  def create
    
  end
end
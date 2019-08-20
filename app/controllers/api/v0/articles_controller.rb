class Api::V0::ArticlesController < ApplicationController
  before_action :authenticate_api_v0_user!, only: [:create]

  def index
    articles = Article.all
    render json: articles, each_serializer: Articles::IndexSerializer
  end

  def create
    article = current_api_v0_user.articles.create(article_params)
    
    if article.persisted?
      render json: { message: 'all good' } 
    else
      render json: { message: 'not good' } 
    end
    
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :author)
  end
end
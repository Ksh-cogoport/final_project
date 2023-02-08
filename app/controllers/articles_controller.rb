class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_request, except: [:index,:create]
    def index
       render json: Article.all
    end

    def show
      @article =Article.find(params[:id])
      render json: @article
    end

    def create
        @article = Article.create(title:params[:title], text:params[:text], category_ids: params[:category_ids], author_id: params[:author_id])
        render json:@article
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(title:params[:title], text:params[:text], category_ids: params[:category_ids])
          render json:@article
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
    end
end

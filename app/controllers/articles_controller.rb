class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_request, except: [:index,:show]
    def index
      @articles=Article.joins(:author).select("id","title","created_at","author_id",
      "name")
      render json: @articles
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
      if @current_user.id==@article.author_id
        if(params[:title])
          @article.update(title:params[:title])
        end
        if(params[:text])
          @article.update(text:params[:text])
        end
        render json:@article
      elsif
        render html:"Not Authorized"
      end
    end

    def destroy
        @article = Article.find(params[:id])
        if @current_user.id==@article.author_id
          @article.destroy
          render html:"distroyed"
        end
    end


end

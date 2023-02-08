class ArticleCategoriesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_request, except: [:index]
    def index
        render json:ArticleCategory.all
    end
end

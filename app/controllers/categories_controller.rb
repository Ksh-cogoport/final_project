class CategoriesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        render json:Category.all
    end

    def create
        @category = Category.new(params.require(:category).permit(:name))
        if @category.save
          render json:@category
        end
    end

    def delete
        @category = Category.find(params[:id])
        @category.destroy
    end
end

class AuthorsController < ApplicationController
    skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_request, only: [:create,:index]
    before_action :set_user, only: [:show, :destroy]

    def index
        @users = Author.all
        render json: @users, status: :ok
    end
    
    def show
        render json: @user,status: :ok
    end

    def create
        @user = Author.create(user_params)
        render json:@user
    end

    def update
        unless @user.update(user_params)
            render json: { errors: @user.errors.full_messages },
            status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
    end

    private

    def user_params
        params.permit(:name, :email, :description, :password, :password_confirmation)
    end
    def set_user
        @user = Author.find(params[:id])
    end
    
end

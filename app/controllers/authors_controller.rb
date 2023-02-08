class AuthorsController < ApplicationController
    skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_request, only: [:create,:index,:allarticles]
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
        @user = Author.find(params[:id])
        if @current_user.id==@user.id
            if(params[:name])
                @article.update(name:params[:name])
            end
            if(params[:description])
                @article.update(title:params[:description])
            end
            if(params[:email])
                @article.update(email:params[:email])
            end
            render json:@article
        elsif
            render html:"Not Authorized"
        end
    end

    def destroy
        @user.destroy
    end

    def allarticles
        @user = Author.find(params[:id])
        render json:@user.articles
    end
    
    # def update_password
    #     user=Author.where(email: params[:email])
    #     if @user != [] && @current_user.email
    #         if user[0].authenticate(params[:user][:password])
    #             user[0].update(password: params[:new_password])
    #             render html:"updated"
    #         else
    #             render html:"incorrect password"
    #         end
    #     else
    #         render html:"not found"
    #     end
    # end

    private

    def user_params
        params.permit(:name, :email, :description, :password, :password_confirmation)
    end
    def set_user
        @user = Author.find(params[:id])
    end
    
end

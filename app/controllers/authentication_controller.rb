# frozen string literal: true

class AuthenticationController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_request, except: :login
    # POST /auth/login
    def login
        @user = Author.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
            token = jwt_encode(user_id: @user.id)
            render json: { token: token, user_id:@user.id}, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end
end

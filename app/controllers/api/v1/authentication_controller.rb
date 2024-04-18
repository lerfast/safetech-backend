module Api
    module V1
      class AuthenticationController < ApplicationController
        skip_before_action :authorize_request, only: [:login, :signup]
  
        # POST /api/v1/signup
        def signup
          user = User.create!(user_params)
          token = encode_token({ user_id: user.id })
          render json: { user: user, token: token }, status: :created
        end
  
        # POST /api/v1/login
        def login
          user = User.find_by(email: params[:email])
          if user && user.authenticate(params[:password])
            token = encode_token({ user_id: user.id })
            render json: { user: user, token: token }, status: :ok
          else
            render json: { error: 'Invalid credentials' }, status: :unauthorized
          end
        end
  
        private
  
        def user_params
            params.require(:user).permit(
              :first_name, :last_name, :email, :phone_number,
              :department_id, :role_id, :password, :password_confirmation
            )
          end
          
  
        def encode_token(payload)
          JWT.encode(payload, Rails.application.secret_key_base, 'HS256')
        end
      end
    end
  end
  
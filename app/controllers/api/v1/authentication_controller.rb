module Api
  module V1
    class AuthenticationController < ApplicationController
      skip_before_action :authorize_request, only: [:login, :signup]
      
      # POST /api/v1/signup
      # Crea un nuevo usuario y retorna un JWT token
      def signup
        user = User.create!(user_params)  # ¡Asegúrate de que el modelo User está configurado con has_secure_password!
        token = encode_token({ user_id: user.id })
        render json: { user: user, token: token }, status: :created
      end

      # POST /api/v1/login
      # Autentica un usuario y retorna un JWT token
      def login
        user = User.find_by(email: params[:email])
        # Autentica al usuario. user.authenticate devuelve false si la contraseña es incorrecta
        if user && user.authenticate(params[:password])
          token = encode_token({ user_id: user.id })
          render json: { user: user, token: token }, status: :ok
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end

      private

      # Parámetros permitidos
      def user_params
        params.require(:user).permit(
          :first_name, :last_name, :email, :phone_number,
          :department_id, :role_id, :password, :password_confirmation
        )
      end
        
      # Codifica un token JWT
      def encode_token(payload)
        JWT.encode(payload, Rails.application.secret_key_base, 'HS256')
      end
    end
  end
end

# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
    before_action :authorize_request

    private

    def authorize_request
        header = request.headers['Authorization']
        if header
          token = header.split(' ').last
          begin
            @decoded = decode_token(token)
            @current_user = User.find(@decoded[:user_id])
          rescue ActiveRecord::RecordNotFound => e
            render json: { errors: e.message }, status: :unauthorized
          rescue JWT::DecodeError => e
            render json: { errors: e.message }, status: :unauthorized
          end
        else
          render json: { errors: 'Nil JSON web token' }, status: :unauthorized
        end
      end

    def decode_token(token)
      JWT.decode(token, Rails.application.secret_key_base, true, { algorithm: 'HS256' })[0].symbolize_keys
    end
end

# frozen_string_literal: true

class Auth::SessionsController < Devise::SessionsController
  respond_to :json

  private
  def respond_with(resource, options={})
    render json: { message: 'User signed in successfully', status: :ok, data: current_user }
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: "User logged out." }, status: :ok
  end

  def log_out_failure
    render json: { message: "User has no active session."}, status: :unauthorized
  end

  # def respond_to_on_destroy
  #   jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
  #   current_user = User.find(jwt_payload['sub'])
  #   if current_user
  #     render json: { message: 'Signed out successfully', status: :ok }
  #   else
  #     render json: { message: 'User has not active session', status: :unauthorized }
  #   end
  # end
end
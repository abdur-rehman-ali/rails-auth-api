# frozen_string_literal: true

class Auth::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private
  def respond_with(resource, options={})
    if resource.persisted?
      render json: { message: 'Signed Up successfully', status: :ok, data: resource }
    else
      render json: { message: "Signed Up failed. User can't be created", status: :unprocessable_entity, errors: resource.errors.full_messages }
    end
  end
end

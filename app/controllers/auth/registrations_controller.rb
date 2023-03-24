# frozen_string_literal: true

class Auth::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private
  def respond_with(resource, options={})
    if resource.persisted?
      render json: { data: UserSerializer.new(resource), message: I18n.t('registrations.create.success') }, status: :created
    else
      render json: { errors: resource.errors.full_messages , message: I18n.t('registrations.create.failure') }, status: :unprocessable_entity
    end
  end
end

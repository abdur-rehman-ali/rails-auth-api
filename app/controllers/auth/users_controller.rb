# frozen_string_literal: true

class Auth::UsersController < ApplicationController 
  before_action :authenticate_user!

  def show 
    render json: current_user, serializer: UserSerializer
  end
end
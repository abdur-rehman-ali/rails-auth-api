# frozen_string_literal: true

module Auth
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
      render json: current_user, serializer: UserSerializer
    end
  end
end

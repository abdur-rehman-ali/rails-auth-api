# frozen_string_literal: true

class BlogPolicy < ApplicationPolicy
  def update?
    user && (user == record.user || user.admin?)
  end

  def destroy?
    user && (user == record.user || user.admin?)
  end
end

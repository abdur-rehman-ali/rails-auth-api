# frozen_string_literal: true

# == Schema Information
#
# Table name: blogs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Blog < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :user
end

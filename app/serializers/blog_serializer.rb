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
class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
end

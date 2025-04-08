# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  message    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #バリデーション
  validates :message, length: { minimum: 2, maximum: 20 }, presence: true
end

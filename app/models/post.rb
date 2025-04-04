# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  label_id   :integer          not null
#
class Post < ApplicationRecord
  #active_storage宣言
  has_one_attached :post_image

  #アソシエーション
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #バリデーション
  validates :boby, presence: true
  validates :image, presence: true
  validates :label_id, presence: true

end

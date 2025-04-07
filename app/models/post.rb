# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  #active_storage宣言
  has_one_attached :post_image

  #アソシエーション
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #バリデーション
  validates :boby, length: { maximum: 100 }, presence: true
  #validates :image, presence: true
  #validates :label_id, presence: true


  # なんだっけ？
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 検索
  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(title: content)
    elsif method == 'forward'
      Post.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Post.where('title LIKE ?', '%'+content)
    else
      Post.where('title LIKE ?', '%'+content+'%')
    end
  end
end

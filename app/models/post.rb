# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Post < ApplicationRecord
  #active_storage宣言
  has_one_attached :post_image

  #関連付け
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #バリデーション
  validates :body, length: { maximum: 100 }, presence: true
  validates :post_image, presence: true
  #validates :label_id, presence: true
  #validates :comment, length: { maximum: 50 }

  def get_image
    (post_image.attached?) ? post_image : 'no_image.jpg'
  end

  # user_idがテーブル内に存在するか調べるメソッド
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 検索
  def self.search_for(word, method)
    if method == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif method == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif method == "backward_match"
      @post = Post.where("title LIKE?","%#{word}")
    elsif method == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all #全表示
    end
  end
end

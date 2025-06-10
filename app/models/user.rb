# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  introduction           :text
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  #active_storage宣言
  has_one_attached :profile_image

  #関連付け
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  #自分がフォローされる（被フォロー）側の関係性
  has_many :followers, through: :reverse_of_relationships, source: :follower
  #被フォロー関係を通じて参照→自分をフォローしている人

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  #自分がフォローする（与フォロー）側の関係性
  has_many :followings, through: :relationships, source: :followed
  #与フォロー関係を通じて参照→自分がフォローしている人

  #バリデーション
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true, presence: true
  validates :introduction, length: { maximum: 50 }

  #ゲストログイン用
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  # ActiveStorage プロフィール画像
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_icon.jpg'
  end

  #フォローする relationshipコントローラー用
  def follow(user)
    relationships.create(followed_id: user.id)
  end

  #フォローを解除する relationshipコントローラー用
  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end

   #指定したユーザーをフォローしているかどうかをinclude？で判定 _btn用
  def following?(user)
    followings.include?(user)
  end

  #検索メソッド実装 LIKEであいまい検索の構文
  def self.looks(word, search)
    search == "partial_match"
    @user = User.where("name LIKE?","%#{word}%")
  end
end

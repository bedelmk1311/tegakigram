# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
class Favorite < ApplicationRecord

  #関連付け
  belongs_to :user
  belongs_to :post
  
  # バリデーション
  # 一意性を持たせて何度もいいねを押せないようにする
  validates_uniqueness_of :post_id, scope: :user_id

end

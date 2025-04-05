# == Schema Information
#
# Table name: labels
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Label < ApplicationRecord

  has_many :posts

  validates :name, presence: { message: "名を入力してください" }
end

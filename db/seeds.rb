# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ターミナル出力メモ
puts "seedの実行を開始"

momotaro = User.find_or_create_by!(email: "momo@test.com") do |user|
  user.name = "桃太郎"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/peaches.jpg"), filename:"peaches.jpg")
end

kintaro = User.find_or_create_by!(email: "kin@test.com") do |user|
  user.name = "金太郎"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/bear_picture.jpg"), filename:"bear_picture.jpg")
end

urasimataro = User.find_or_create_by!(email: "urasima@test.com") do |user|
  user.name = "浦島太郎"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/turtle_picture.png"), filename:"turtle_picture.png")
end

Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gyoza_sign.jpg"), filename:"gyoza_sign.jpg"),
  body: "のぼりが手書きでした。味わいがあって好きです。",
  user: momotaro
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pop_anago.jpg"), filename:"pop_anago.jpg"),
  body: "あなごの特売POP。筆ペンとマーカーを使用しています。",
  user: momotaro
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/yakitori_sign.jpg"), filename:"yakitori_sign.jpg"),
  body: "知り合いがやっている焼き鳥屋さん。れっきとした看板で、決して落書きではないそうです。",
  user: kintaro
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pop_simesaba.jpg"), filename:"pop_simesaba.jpg"),
  body: "良い鯖が入荷すると仕込みたくなるが口癖の店長。明日のポスター作りの下書きです。",
  user: urasimataro
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pop_osusume.jpg"), filename:"pop_osusume.jpg"),
  body: "日替わりで出すお魚通信。",
  user: urasimataro
)

puts "seedの実行が完了しました"
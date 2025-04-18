# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ターミナル出力メモ
puts "seedの実行を開始"

Admin.create!(
   email: 'admin@test.com',
   password: 'tegakigram'
)

momotaro = User.find_or_create_by!(email: "momo@test.com") do |user|
  user.name = "桃太郎"
  user.password = "password"
  user.introduction = "見る専アカウント/フォロバ100%"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/peaches.jpg"), filename:"peaches.jpg")
end
kintaro = User.find_or_create_by!(email: "kin@test.com") do |user|
  user.name = "金太郎"
  user.password = "password"
  user.introduction = "筆ペン練習マン"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/bear_picture.jpg"), filename:"bear_picture.jpg")
end
urasimataro = User.find_or_create_by!(email: "urasima@test.com") do |user|
  user.name = "浦島太郎＠旅なう"
  user.password = "password"
  user.introduction = "居酒屋の写真をあげることが多めです。海鮮料理ラブ"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/turtle_picture.png"), filename:"turtle_picture.png")
end
kaguya = User.find_or_create_by!(email: "kaguya@test.com") do |user|
  user.name = "KAGUYA"
  user.password = "password"
  user.introduction = "好きなものはストリートアート、ガラスペイント系。"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/banboo.jpg"), filename:"banboo.jpg")
end
shirayuki= User.find_or_create_by!(email: "snow@test.com") do |user|
  user.name = "Snow White"
  user.password = "password"
  user.introduction = "北国にある魚屋見習い。記録用であげていきます"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/snowwhite.jpg"), filename:"snowwhite.jpg")
end

Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gyoza_sign.jpg"), filename:"gyoza_sign.jpg"),
  body: "のぼりが手書きでした。味わいがあって好きです。",
  user: urasima
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pop_anago.jpg"), filename:"pop_anago.jpg"),
  body: "あなごの特売POP。筆ペンとマーカーを使用しています。",
  user: kintaro
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/yakitori_sign.jpg"), filename:"yakitori_sign.jpg"),
  body: "知り合いがやっている焼き鳥屋さん。れっきとした看板で、決して落書きではないそうです。",
  user: urasima
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pop_simesaba.jpg"), filename:"pop_simesaba.jpg"),
  body: "良い鯖が入荷すると仕込みたくなるが口癖のうちのお父さん。明日のポスター作りの下書きです。",
  user: shirayuki
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pop_osusume.jpg"), filename:"pop_osusume.jpg"),
  body: "日替わりで出すお魚通信。乾いたらラミネートかけて店先に出します。",
  user: shirayuki
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/glass_unagi.jpg"), filename:"glass_unagi.jpg"),
  body: "制作依頼品。塗りつぶしが大変だったので極太タイプも持っておいた方がよかったな〜と。",
  user: kaguya
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/glass_tako.jpg"), filename:"glass_tako.jpg"),
  body: "制作依頼品。ライトアップすると窓ガラスアートって映えるよね〜",
  user: kaguya
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/hand_written.jpg"), filename:"hand_written.jpg"),
  body: "慣れるまで大変だけど油性の筆ペンはまじで商品展開少ないのでみんなにすすめたい",
  user: kintaro
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/salmon.jpg"), filename:"pop_salmon.jpg"),
  body: "鮭ばっかり描いてたらだんだん上手くなってきた",
  user: shirayuki
)Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/quote.jpg"), filename:"quote.jpg"),
  body: "木目と白の相性良き。次の制作のヒントに。",
  user: kaguya
)
puts "seedの実行が完了しました"
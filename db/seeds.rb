# ターミナル出力メモ
puts "seedの実行を開始"
# Admin
Admin.find_or_create_by!(email: ENV['ADMIN_EMAIL']) do |admin|
  admin.password = ENV['ADMIN_PASSWORD']
end

#ユーザー
momotaro = User.find_or_create_by!(email: "momo@test.com") do |user|
  user.name = "桃太郎"
  user.password = "password"
  user.introduction = "見る専アカウント/フォロバ100%/全員の投稿をいいねして全員をフォローしています。"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/peaches.jpg"), filename:"peaches.jpg")
end
kintaro = User.find_or_create_by!(email: "kin@test.com") do |user|
  user.name = "金太郎"
  user.password = "password"
  user.introduction = "始めたばかりです。よろしくお願いします。最近はもっぱら筆ペン練習マンとなっています"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/bear_picture.jpg"), filename:"bear_picture.jpg")
end
urasimataro = User.find_or_create_by!(email: "urashima@test.com") do |user|
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
  user.introduction = "北国にある魚屋見習い。おすすめのお魚新聞を趣味で書いています。自分の記録用であげていきます。"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/snowwhite.jpg"), filename:"snowwhite.jpg")
end

# 投稿　no such column: posts.post_imageのエラーが出てしまう
# Post.find_or_create_by!( 
#   post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gyoza_sign.jpg"), filename:"gyoza_sign.jpg"),
#   body: "のぼりが手書きでした。味わいがあって好きです。",
#   user: urasimataro
# )

Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gyoza_sign.jpg"), filename:"gyoza_sign.jpg"),
  body: "のぼりが手書きでした。味わいがあって好きです。",
  user: urasimataro
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pop_anago.jpg"), filename:"pop_anago.jpg"),
  body: "あなごの特売POP。筆ペンとマーカーを使用しています。数字をフリーハンドで書くのが難しかった。練習あるのみ。",
  user: kintaro
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/yakitori_sign.jpg"), filename:"yakitori_sign.jpg"),
  body: "知り合いがやっている焼き鳥屋さん。シャッターに書いたれっきとした看板で、決して落書きではないそうです。",
  user: urasimataro
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
  body: "慣れるまで大変だけど、油性の筆ペンは商品展開少ないのでこのブランドおすすめです。",
  user: kintaro
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/salmon.jpg"), filename:"pop_salmon.jpg"),
  body: "鮭ばっかり描いてたらだんだん上手くなってきた",
  user: shirayuki
)
Post.create( 
  post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/quote_sign.jpg"), filename:"quote_sign.jpg"),
  body: "木目と白の相性良き。次の制作のヒントに。",
  user: kaguya
)

#コメント
comments_data = [
  { message: "地味に餃子ぬいぐるみもかわいい", post_id: 1 },
  { message: "斬新なアイディア", post_id: 3 },
  { message: "シンプルだけどこういうのが目立っていいんだよね", post_id: 4 },
  { message: "筆の掠れぐらいが神。", post_id: 5 },
  { message: "下書きとかはどうやっているんですか？", post_id: 6 },
  { message: "めちゃくちゃかっこいいです！", post_id: 7 },
  { message: "超リアル。図鑑みたい", post_id: 9 },
  { message: "次回作楽しみにしてます！", post_id: 10 }
]
comments_data.each do |comment_data|
  Comment.find_or_create_by!(comment_data.merge(user: kintaro))
end

comments_data = [
  { message: "すごい、浅締めシメサバだ", post_id: 4 },
  { message: "超POP", post_id: 6 },
  { message: "一気に雰囲気でるなあ", post_id: 8 },
  { message: "イラスト展やるべき", post_id: 9 },
  { message: "こういうカフェでコーヒー飲みたい", post_id: 10 }
]
comments_data.each do |comment_data|
  Comment.find_or_create_by!(comment_data.merge(user: urasimataro))
end
comments_data = [
  { message: "いつも写真が綺麗", post_id: 1 },
  { message: "ここ知ってるー!この前TVで紹介されていたよね", post_id: 3 },
  { message: "白雪ちゃん上手くなったね〜!", post_id: 5 },
  { message: "すごい!手ぬぐいとか商品化したい", post_id: 8 },
  { message: "これは鱒？それとも鮭？", post_id: 9 }
]
comments_data.each do |comment_data|
  Comment.find_or_create_by!(comment_data.merge(user: kaguya))
end
comments_data = [
  { message: "いつもコメントありがとうございます！！あなごの字体が好きです！", post_id: 2 },
  { message: "うちのお店と同じぐらい古いです。。", post_id: 3 },
  { message: "ほんとは灰色の部分を鯖柄にしたかったんですけど、バイトの子にゼブラ柄と言われてしまったので諦めました、、、", post_id: 4 },
  { message: "すごいです！うちも丑の日でこういうの書いてみたいです。", post_id: 6 },
  { message: "かぐやさんありがとうございます！いつも無言でいいねですみません！", post_id: 5 }
]
comments_data.each do |comment_data|
  Comment.find_or_create_by!(comment_data.merge(user: shirayuki))
end

#フォロー・フォロワー
Relationship.create(follower_id: 1, followed_id: 2)
Relationship.create(follower_id: 1, followed_id: 3)
Relationship.create(follower_id: 1, followed_id: 4)
Relationship.create(follower_id: 1, followed_id: 5)

Relationship.create(follower_id: 2, followed_id: 1)
Relationship.create(follower_id: 2, followed_id: 3)
Relationship.create(follower_id: 2, followed_id: 4)
Relationship.create(follower_id: 2, followed_id: 5)

Relationship.create(follower_id: 3, followed_id: 4)
Relationship.create(follower_id: 3, followed_id: 5)

Relationship.create(follower_id: 5, followed_id: 1)
Relationship.create(follower_id: 5, followed_id: 2)
Relationship.create(follower_id: 5, followed_id: 3)
Relationship.create(follower_id: 5, followed_id: 4)

Relationship.create(follower_id: 4, followed_id: 3)
Relationship.create(follower_id: 4, followed_id: 5)

#桃太郎のいいね
Favorite.create(user_id: 1, post_id: 1)
Favorite.create(user_id: 1, post_id: 2)
Favorite.create(user_id: 1, post_id: 3)
Favorite.create(user_id: 1, post_id: 4)
Favorite.create(user_id: 1, post_id: 5)
Favorite.create(user_id: 1, post_id: 6)
Favorite.create(user_id: 1, post_id: 7)
Favorite.create(user_id: 1, post_id: 8)
Favorite.create(user_id: 1, post_id: 9)
Favorite.create(user_id: 1, post_id: 10)

#金太郎のいいね
Favorite.create(user_id: 2, post_id: 1)
Favorite.create(user_id: 2, post_id: 3)
Favorite.create(user_id: 2, post_id: 4)
Favorite.create(user_id: 2, post_id: 5)
Favorite.create(user_id: 2, post_id: 6)
Favorite.create(user_id: 2, post_id: 7)
Favorite.create(user_id: 2, post_id: 9)
Favorite.create(user_id: 2, post_id: 10)

#白雪姫のいいね
Favorite.create(user_id: 5, post_id: 1)
Favorite.create(user_id: 5, post_id: 2)
Favorite.create(user_id: 5, post_id: 3)
Favorite.create(user_id: 5, post_id: 6)
Favorite.create(user_id: 5, post_id: 7)
Favorite.create(user_id: 5, post_id: 8)
Favorite.create(user_id: 5, post_id: 10)

#かぐや姫のいいね
Favorite.create(user_id: 2, post_id: 4)
Favorite.create(user_id: 2, post_id: 5)
Favorite.create(user_id: 2, post_id: 9)

puts "seedの実行が完了しました"
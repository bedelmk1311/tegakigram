### == Route Map
### ↓ターミナルに入れるとルーティング情報を書き出す
### bundle exec annotate --routes

Rails.application.routes.draw do
  # 管理者用 ログイン機能のみルーティングに登録
  # skipオプションでサインインを削除
  devise_for :admin,
    skip: [:registrations, :passwords] ,
    controllers: { sessions: "admin/sessions" }

  #
  devise_for :users

  # namespaceでadminをまとめる
  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:show, :index, :destroy] # こっちのdestroyは投稿を消したい

    get "comfirm_post", to: "comfirm_post#comfirm" #仮
    get "comfirm_comment", to: "comfirm_post#comfirm" #仮
    get "index_comment", to: " # " #仮
    delete "URL", to: " # " #仮 コメントを消したい

    get "/search", to: "searches#search"
    # 検索機能にアクセスするためのルーティング
  end
  
  #scope moduleでカスタマイズ
  scope module: :public do
    root to:"home#top"

    #postと子(commentとfavorite)のルーティング
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    #userとrelationshipのルーティング
    resources :users, only: [:show,:edit,:update] do
      get "users/confirm" => "users#confirm"
      patch "users/withdraw" => "users#withdraw"
        resource :relationships, only: [:create, :destroy]
          get "followings" => "relationships#followings", as: "followings"
          get "followers" => "relationships#followers", as: "followers"
    end
     #searshのルーティング
    get "/search", to: "searches#search"
  end

end

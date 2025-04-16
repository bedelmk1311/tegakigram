### == Route Map
### ↓ターミナルに入れるとルーティング情報を書き出す
### bundle exec annotate --routes

#resourcesの中身
#get 'posts'     => 'posts#index'
#post 'posts' => 'posts#create'
#get 'posts/new' => 'posts#new'

#get 'posts/:id/edit' => 'posts#edit'
#get 'posts/:id' => 'posts#show'
#patch 'posts/:id'  => 'posts#update'
#delete 'posts/:id' => 'posts#destroy'


Rails.application.routes.draw do
  # 管理者用 
  # skipオプションでサインインを削除
  devise_for :admin,
    skip: [:registrations, :passwords] ,
    controllers: { sessions: "admin/sessions" }

  # コントローラーの指定
  devise_for :users,
    controllers: { registrations: "public/registrations", sessions: "public/sessions"}

  #ゲストモード用のルーティング
  devise_scope :user do
    post "public/guest_sign_in", to: "public/sessions#guest_sign_in"
  end


  #scope moduleでカスタマイズ
  scope module: :public do
    root to:"homes#top"

    #postと子(commentとfavorite)のルーティング
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy] #1回しかいいねできないから単数系
      member do
        # いいねした投稿一覧
        get :index_favorite
     end
    end

    #userとrelationshipのルーティング
    resources :users, only: [:show,:edit,:update, :destroy] do
      get "confirm" => "users#confirm"

      resource :relationships, only: [:create, :destroy]
        get "followings" => "relationships#followings", as: "followings"
        get "followers" => "relationships#followers", as: "followers"
    end

     #searchのルーティング
    get "/search", to: "searches#search"
  end

  # namespaceでadminをまとめる
  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:show, :index, :destroy] # こっちのdestroyは投稿を消したい

    #get "confirm_post", to: "confirm_post#confirm" #仮
    #get "confirm_comment", to: "confirm_post#confirm" #仮
    #get "index_comment", to: " # " #仮
    #delete "URL", to: " # " #仮 コメントを消したい

    get "/search", to: "searches#search"
    # 検索機能にアクセスするためのルーティング
  end

end

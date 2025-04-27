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
    get "/about", to: "homes#about"

    #searchのルーティング
    get "/search", to: "searches#search"

    #postと子(commentとfavorite)のルーティング
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy] #1回しかいいねできないから単数系
    end

    #userとrelationshipのルーティング
    resources :users, only: [:show,:edit,:update, :destroy] do
      get "confirm" => "users#confirm"
      member do
        get :index_favorite
        get :index_follow
     end
      resource :relationships, only: [:create, :destroy]
        get "followings" => "relationships#followings", as: "followings"
        get "followers" => "relationships#followers", as: "followers"
    end
  end

  # namespaceでadminをまとめる
  namespace :admin do
    root to: "users#index"
    get "/search", to: "searches#search"
    resources :users, only: [:show, :index, :destroy] 
  end
end

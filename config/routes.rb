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
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  # namespaceでadminをまとめる
  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:show, :index, :destroy] # こっちのdestroyは投稿を消したい

    #get "comfirm_post", to: "comfirm_post#comfirm" #仮
    #get "comfirm_comment", to: "comfirm_post#comfirm" #仮
    #get "index_comment", to: " # " #仮
    #delete "URL", to: " # " #仮 コメントを消したい

    get "/search", to: "searches#search"
    # 検索機能にアクセスするためのルーティング
  end
  
  #scope moduleでカスタマイズ
  scope module: :public do
    root to:"homes#top"

    #postと子(commentとfavorite)のルーティング
    #resources :posts  #do
      #resources :comments, only: [:create, :destroy]
      #resource :favorites, only: [:create, :destroy]
        #get 'posts/new'
        #post 'posts/new' => 'posts#create' # /posts/newにPOSTリクエストを受け付ける
        #get 'posts' => 'posts#index' 
    #end
    resources :posts

    #userとrelationshipのルーティング
    resources :users, only: [:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
        get "followings" => "relationships#followings", as: "followings"
        get "followers" => "relationships#followers", as: "followers"
    end

    get "users/confirm" => "users#confirm" # confirmとwithdrawが怪しい
    patch "users/withdraw" => "users#withdraw"

     #searshのルーティング
    get "/search", to: "searches#search"
  end

end

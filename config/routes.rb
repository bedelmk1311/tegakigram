# == Route Map
# ターミナルに入れるとルーティング情報を書き出す
# bundle exec annotate --routes

Rails.application.routes.draw do
  # 管理者用 ログイン機能のみルーティングに登録
  # skipオプションでサインインを削除
  devise_for :admin,
    skip: [:registrations, :passwords] ,
    controllers: { sessions: "admin/sessions" }

  #
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # namespaceでadminをまとめる
  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:index, :show, :destroy]
    get "search", to: "searches#search"
    # 検索機能にアクセスするためのルーティング
  end
  
  #scope moduleでカスタマイズ
  scope module: :public do
    root to:"home#top"
    resources :, only: [:index, :show]
    get "home/about"=>"homes#about"
  
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end


    resources :users, only: [:show,:edit,:update] do
      patch "users/withdraw" => "users#withdraw"
      get "users/confirm" => "users#confirm"

      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
    end
    get 'search', to: 'searches#search'


end

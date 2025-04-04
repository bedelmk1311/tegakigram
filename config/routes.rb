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

  # namespace :[グループ名] do
  # [グループ]にまとめる場合
  # end
  
  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:index, :show, :destroy]
    get "/search", to: "searches#search"
    # 検索機能にアクセスするためのルーティング

end

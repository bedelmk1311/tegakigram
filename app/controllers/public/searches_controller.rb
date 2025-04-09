class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range] #
    @word = params[:word]
    @method = params[:method]
      if @model == 'user' #表示させる結果を条件分岐
        @users = User.search_for(@word, @method) #検索内容を取得
      else
        @posts = Post.search_for(@word, @method)
      end
  end
end

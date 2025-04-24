class Public::SearchesController < ApplicationController
  def search
    @range = params[:range] 
    @word = params[:word] #検索結果用
    @search = params[:search] #検索結果用
      if @range == 'User' #表示させる結果を条件分岐
        @users = User.looks(params[:word], params[:search]) #looksメソッドで検索内容を取得
      else
        @posts = Post.looks(params[:word], params[:search])
      end
  end
end

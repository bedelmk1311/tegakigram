class Public::HomesController < ApplicationController
  def top
  end

  def about
    #order(created_at: :desc)で降順で並び替える
    @posts = Post.all.limit(4).order(created_at: :desc)
  end
end

class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    params[:id]
  end
end

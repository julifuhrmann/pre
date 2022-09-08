class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favorite = Favorite.new
  end
end

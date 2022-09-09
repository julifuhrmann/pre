class FavoritesController < ApplicationController
  before_action :set_favorite, only: :destroy

  def index
    @favorites = Favorite.where(follower_id: current_user.id)
    # @my_favorite_users = User.where(follower_id: current_user.id)
  end

  def create
    # @favorite = Favorite.new(favorite_params)

      user_params = params[:user]
      user = User.find(params[:user])

      @new_favorite = Favorite.new(
        follower_id: current_user.id,
        followed_id: user_params
      )
    @new_favorite.save


    redirect_to user_path(user)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    redirect_to favorites_path, status: :see_other
  end

  private

  def set_favorite
    @favorite = Favorite.find_by(followed: params[:followed], follower: params[:follower])
  end

  def favorite_params
    params.require(:favorite).permit(:followed_id, :follower_id)
  end
end

class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.save

    redirect_to favorite_path(@favorite)
  end

  def destroy
    @favorite.destroy

    redirect_to favorites_path, status: :see_other
  end

  private

  def favorite_params
    params.require(:favorite).permit(:followed_id, :follower_id)
  end
end

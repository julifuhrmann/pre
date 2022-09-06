class FavoritesController < ApplicationController
  def create
    # @favorite = Favorite.new(favorite_params)

      user_params = params[:user]
      user = User.find(params[:user])

      @new_favorite = Favorite.new(
        follower_id: current_user.id,
        followed_id: user_params
      )
    @new_favorite.save


    redirect_to user_path(user), notice: "You have favorited this person"
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

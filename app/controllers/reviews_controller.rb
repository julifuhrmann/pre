class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @party = Party.find(params[:party_id])
    @user = @party.user
    @review = Review.new(review_params)
    @review.party = @party

    @review.user = current_user
    @review.save
    respond_to do |format|
      if @review.save
        format.html { redirect_to party_path @party }
        format.json
      else
        format.html { render "parties/show", status: :unprocessable_entity }
        format.json
      end
    end
    # redirect_to party_path @party
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end

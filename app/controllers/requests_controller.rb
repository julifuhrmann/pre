class RequestsController < ApplicationController
  before_action :set_party, only: [:create, :destroy]

  def index
    @requests = Request.all
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    @request.party = @party
    if @request.save
      redirect_to parties_path(@party)
    else
      render :new, status: :unprocessable_entity
    end
    raise
  end

  def destroy
    @request.destroy

    redirect_to requests_path, status: :see_other
  end

  private

  def set_party
    @party = Party.find(params[:party_id])
  end

  def request_params
    params.require(:request).permit(:status)
  end
end

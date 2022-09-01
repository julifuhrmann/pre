class RequestsController < ApplicationController
  before_action :set_request, only: [:update, :accept]
  before_action :set_party, only: [:create, :destroy]

  def index
    @requests = Request.all
  end

  def update
    if params[:commit] == "accepted"
      @request.accepted!
    else
      @request.declined!
    end
    redirect_to requests_path
  end

  def create
    @request = Request.new
    if @party.status == 1
      @request.status == 1
    else
      @request.status = 0
    end
    @request.user = current_user
    @request.party = @party
    if @request.save
      redirect_to party_path(@party)
    else
      render new, status: :unprocessable_entity
    end
  end

  def accept
    @request.status = 1
  end

  def decline
    @request.status = 2
  end

  def destroy
    @request.destroy

    redirect_to requests_path, status: :see_other
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def set_party
    @party = Party.find(params[:party_id])
  end

  def request_params
    params.require(:request).permit(:status, :button_action, :accepted, :declined)
  end
end

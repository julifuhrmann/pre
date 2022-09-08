class RequestsController < ApplicationController
  before_action :set_request, only: [:update, :destroy]
  before_action :set_party, only: [:create, :destroy]

  def index
    @my_requests = Request.where(user: current_user)
    @people_requests = Request.where(party: current_user.party_ids)
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
    set_request_status
    @request.user = current_user
    @request.party = @party
    if @request.save
      redirect_to party_path(@party)
    else
      render new, status: :unprocessable_entity
    end
  end

  def accept
    @request = Request.find(params[:format])
    @request.update(status: 1)
    redirect_to requests_path
  end

  def decline
    @request = Request.find(params[:format])
    @request.update(status: 2)
    redirect_to requests_path
  end

  def destroy
    @request.destroy
    redirect_to party_path(@party), status: :see_other
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def set_party
    @party = Party.find(params[:party_id])
  end

  def request_params
    params.require(:request).permit(:status)
  end

  def set_request_status
    if @party.status == 1
      @request.status == 1
    else
      @request.status = 0
    end
  end
end

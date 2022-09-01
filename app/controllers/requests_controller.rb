class RequestsController < ApplicationController
  before_action :set_request, only: [:update, :accept]


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
    @request = Request.new(party_params)
    @request.save

    redirect_to request_path(@request)
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

  def request_params
    params.require(:request).permit(:status, :button_action, :accepted, :declined)
  end
end

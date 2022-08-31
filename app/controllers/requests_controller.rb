class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def create
    @request = Request.new(party_params)
    @request.save

    redirect_to request_path(@request)
  end

  def destroy
    @request.destroy

    redirect_to requests_path, status: :see_other
  end

  private

  def request_params
    params.require(:request).permit(:status)
  end
end

class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @parties = Party.all

    @parties = @parties.geocoded.map do |party|
      {
        lat: party.latitude,
        lng: party.longitude
      }
    end
  end

  def show
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    @party.save

    redirect_to party_path(@party)
  end

  def edit
  end

  def update
    @party.update(party_params)

    redirect_to party_path(@party)
  end

  def destroy
    @party.destroy

    redirect_to parties_path, status: :see_other
  end

  private

  def set_party
    @party = Party.find(params[:id])
  end

  def party_params
    params.require(:party).permit(:name, :date, :status, :description, :address)
  end
end

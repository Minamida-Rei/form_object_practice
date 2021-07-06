class DonationsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @donaiton_address = DonationAddress.new
  end

  def create
    @donation_address = DonationAddress.new(donation_params)
    if @donaiton_address.valid?
       @donation_address.save
       redirect_to root_path
    else
      render :new
    end
  end

  private

  def donation_params
    params.require(:donation_address).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :price).merge(user_id: current_user.id)
  end
end

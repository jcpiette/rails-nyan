class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def address
    @address = User.find(params[:address])
    @address.save
    # Find your user by current user
    # Assign the address hash to the address attribute of said user
    # Save it
    # if params['address']
  end

  def preference

  end

  def notification
  end

  private

  def address_params
    params.require(:planet).permit(:name, :price, :desc, :photo)
  end
end

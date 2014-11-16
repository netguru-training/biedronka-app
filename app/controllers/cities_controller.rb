class CitiesController < ApplicationController
  expose :cities
  expose :city

  def destroy
    city.destroy
    redirect_to root_path, notice: 'City successfully deleted'
  end
end

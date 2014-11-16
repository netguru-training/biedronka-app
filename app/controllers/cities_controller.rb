class CitiesController < ApplicationController
  before_action :is_signed_in, only: [:create, :update, :destroy]
  before_action :verify_admin, only: [:create, :update, :destroy]

  expose :cities
  expose :city

  def create
    city = City.new(city_params)
    if city.save
      redirect_to cities_path, notice: 'City was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if city.update(city_params)
      redirect_to cities_path, notice: 'City successfully updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    city.destroy
    redirect_to root_path, notice: 'City successfully deleted'
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end
end

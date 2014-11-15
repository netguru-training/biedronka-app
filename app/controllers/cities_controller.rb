class CitiesController < ApplicationController
  before_action :authenticate_user!

  expose_decorated :city
  expose :cities

  def index
    binding.pry
  end
end

class PromotionsController < ApplicationController
  before_action :verify_admin, only: [:edit, :update, :create, :destroy]

  def verify_admin
    unless current_user.admin?
      flash[:error] = "You have insufficient right to do this."
      redirect_to promotion_index_path
    end
  end

  def index

  end

  def show

  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end

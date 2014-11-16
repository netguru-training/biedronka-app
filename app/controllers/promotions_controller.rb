class PromotionsController < ApplicationController
  before_action :is_signed_in, only: [:create, :update, :destroy]
  before_action :verify_admin, only: [:create, :update, :destroy]


  expose(:city)
  expose(:shops) { city.shops }
  expose(:promotions)
  expose(:promotion)

  def update
    #promotion = promotions.find(params[:id])
    if promotion.update(promotion_params)
      redirect_to city_promotions_path, notice: 'Promotion successfully updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    promotion.destroy
    redirect_to city_promotions_path, notice: 'Promotion successfully deleted' 
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :description, :start_date, :end_date, :modifier, :city_id)
  end

  def is_signed_in
    redirect_to city_promotions_path, notice: 'Sorry, you are not signed in!' unless user_signed_in?
  end

  def verify_admin
    unless current_user.admin?
      flash[:error] = "You have insufficient right to do this."
      redirect_to city_promotions_path
    end
  end

end

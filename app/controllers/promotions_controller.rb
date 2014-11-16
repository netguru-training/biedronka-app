class PromotionsController < ApplicationController
  before_action :verify_admin, only: [:create, :destroy]


  expose(:city)
  expose(:shops) { city.shops }
  expose(:promotions)
  expose(:promotion)

  def update
    promotion = promotions.find(params[:id])
    if promotion.update(promotion_params)
      redirect_to city_promotions_path, notice: 'Promotion successfully updated'
    else
      render action: 'edit'
    end
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :description, :start_date, :end_date, :modifier, :city_id)
  end

  def verify_admin
    unless current_user.admin?
      flash[:error] = "You have insufficient right to do this."
      redirect_to promotion_index_path
    end
  end

end

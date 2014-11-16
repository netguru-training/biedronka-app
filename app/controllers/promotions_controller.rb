class PromotionsController < ApplicationController
  before_action :is_signed_in, only: [:create, :update, :destroy]
  before_action :verify_admin, only: [:create, :update, :destroy]


  expose(:city)
  expose(:shops) { city.shops }
  expose(:promotions)
  expose(:promotion, params: :promotion_params)

  def update
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

end

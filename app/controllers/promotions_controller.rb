class PromotionsController < ApplicationController
  before_action :is_signed_in, only: [:create, :update, :destroy]
  before_action :verify_admin, only: [:create, :update, :destroy]

  expose(:city)
  expose(:shops) { city.shops }
  expose(:products) {city.products}
  expose(:promotions)
  expose(:promotion)

  def create
    promotion = Promotion.new(promotion_params)
    if promotion.save
      redirect_to city_promotions_path(city), notice: 'Promotion was successfully created.'
    else
      render action: 'new'
    end
  end

  def index
    respond_to do |format|
      format.html
      format.json { render json: PromotionsDatatable.new(view_context, current_user) }
    end
  end

  def update
    if promotion.update(promotion_params)
      redirect_to city_promotions_path(city), notice: 'Promotion successfully updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    promotion.destroy
    redirect_to city_promotions_path(city), notice: 'Promotion successfully deleted'
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :description, :start_date, :end_date, :modifier, :city_id, :product_id)
  end

end

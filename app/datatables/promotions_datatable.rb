class PromotionsDatatable
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::TagHelper

  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view, current_user)
    @view = view
    @current_user = current_user
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: @view.promotions.count,
      iTotalDisplayRecords: @view.promotions.count,
      aaData: data
    }
  end

private

  def data
    promotions.map do |promotion|
      link_str = link_to('Show', city_promotion_path(promotion.product.shop.city, promotion), class: 'btn btn-default')
      if @current_user.present? && @current_user.admin?
        link_str += link_to('Edit', edit_city_promotion_path(promotion.product.shop.city,promotion), class: 'btn btn-default')
        link_str += link_to('Delete', city_promotion_path(promotion.product.shop.city,promotion), method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-default')
      end
      cols = [
        promotion.name,
        promotion.description,
        promotion.start_date,
        promotion.end_date,
        promotion.modifier,
        promotion.product.name,
        link_str
      ]
      cols
    end
  end

  def promotions
    @promotions ||= fetch_promotions
  end

  def fetch_promotions
    promotions = @view.promotions.order("#{sort_column} #{sort_direction}")
    promotions = promotions.page(page).per_page(per_page)
    promotions
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name description start_date end_date modifier product_id]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end

class ProductsController < ApplicationController
  expose(:products)
  expose(:product)
  def index
  end

  def new
  end

  def create
    self.product = Product.new(product_params)
    if product.save
      redirect_to products_path, notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if product.update(product_params)
      redirect_to products_path, notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def show
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :base_price, :shop_id, :category, :image)
    end

end

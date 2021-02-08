class ProductsController < ApplicationController

  def index
    @products = Product.all
    set_currencies
    puts "#{@cash}**********"
  end

  def show
    @product = Product.find(params[:id])
  end

  def change_currency
    @product = Product.find(params[:id])
    @price = @product.get_price(params[:currency])
    @currency = params[:currency]
    respond_to do |format|
      format.js {}
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end
end

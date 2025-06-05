class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  
  def index
    if params[:category].present?
      @products = Product.where(category: params[:category])
    else
      @products = Product.all
    end
    @products = @products.group_by(&:category)
  end
  
  def show
    @product = Product.find(params[:id])
  end
end

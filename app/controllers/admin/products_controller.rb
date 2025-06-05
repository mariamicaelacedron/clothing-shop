module Admin
  class ProductsController < ApplicationController
    before_action :require_admin
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    
    def index
      @products = Product.all
    end
    
    def new
      @product = Product.new
    end
    
    def create
      @product = current_user.products.build(product_params)
      
      if @product.save
        redirect_to admin_products_path, notice: 'Producto creado exitosamente'
      else
        render :new, status: :unprocessable_entity
      end
    end
    
    def edit
    end
    
    def update
      if @product.update(product_params)
        redirect_to admin_products_path, notice: 'Producto actualizado exitosamente'
      else
        render :edit, status: :unprocessable_entity
      end
    end
    
    def destroy
      @product.destroy
      redirect_to admin_products_path, notice: 'Producto eliminado exitosamente'
    end
    
    private
    
    def set_product
      @product = Product.find(params[:id])
    end
    
    def product_params
      params.require(:product).permit(:name, :category, :description, :price, :image)
    end
    
    def require_admin
      unless current_user&.admin?
        redirect_to root_path, alert: 'No tienes permisos para acceder a esta sección'
      end
    end
  end
end 
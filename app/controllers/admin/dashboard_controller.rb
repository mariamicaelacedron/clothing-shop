module Admin
  class DashboardController < ApplicationController
    before_action :require_admin
    
    def index
      @total_products = Product.count
      @products_by_category = Product.group(:category).count
    end
    
    private
    
    def require_admin
      unless current_user&.admin?
        redirect_to root_path, alert: 'No tienes permisos para acceder a esta sección'
      end
    end
  end
end 
class Product < ApplicationRecord
  belongs_to :user
  
  enum :category, {
    ropa_mujer: 0,
    ropa_interior_mujer: 1,
    ropa_interior_hombre: 2,
    ropa_hombre: 3
  }
  
  validates :name, presence: true
  validates :category, presence: true
  validates :image, presence: true
  
  has_one_attached :image
end 
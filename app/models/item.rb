class Item < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :product_id, presence: true
  validates :order_id, presence: true
  validates :quantity, numericality: true

  def increase_quantity(quantity)
  	self.quantity += quantity.to_i
  end

  def unity_price
  	self.product.price
  end

  def name
  	self.product.name
  end

  def total_price
  	self.product.price * self.quantity
  end
  
end

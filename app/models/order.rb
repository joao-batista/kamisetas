class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :status_order
  belongs_to :payment
  has_many :items
  has_many :products, :through => :items

  def add_product_and_quantity(product, quantity)
  	current_item = self.items.find_by_product_id(product.id)
  	if current_item
  		current_item.increase_quantity(quantity)
  		current_item.save
  	else
  		current_item = self.items.create(:product => product, :quantity => quantity)
  	end
  	current_item
  end

  def remove_product(product)
    current_item = self.items.find_by_product_id(product.id)
    if current_item
      current_item.destroy
    end
  end

  def total_price
  	self.items.to_a.sum{|item| item.total_price}
  end

  def no_empty?
  	self.items.size > 0
  end

  def quantity_items
  	self.items.to_a.sum{|item| item.quantity}
  end

end

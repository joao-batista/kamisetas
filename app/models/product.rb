class Product < ActiveRecord::Base
	has_many :items
	has_many :orders, :through => :items
	has_many :product_sizes
	has_many :sizes, :through => :product_sizes
	belongs_to :category
	mount_uploader :picture, PictureUploader

	#accepts_nested_attributes_for :sizes, reject_if: :all_blank, allow_destroy: true
end

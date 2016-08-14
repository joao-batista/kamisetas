class Product < ActiveRecord::Base
	has_many :items
	has_many :orders, :through => :items
	belongs_to :category
	mount_uploader :picture, PictureUploader
end

class Product < ActiveRecord::Base
	validates :name, :code, :presence => true
end

class Recipe < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  attr_accessible :Ingredients, :description, :name
end

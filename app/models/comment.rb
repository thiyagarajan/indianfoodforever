class Comment < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :comment
end

class Comment < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :commenter, :body, :recipe_id
  validates_presence_of :commenter
  validates_presence_of :body
end

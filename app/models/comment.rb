class Comment < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :commenter, :body, :recipe_id
end

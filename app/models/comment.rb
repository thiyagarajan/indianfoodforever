class Comment < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :commenter, :body, :recipe_id
  validates :commenter, :presence => true
  validates :body, :presence => true,
            :length => {:minimum => 50}
end

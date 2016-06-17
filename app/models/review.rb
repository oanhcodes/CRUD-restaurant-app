class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: "User"
  belongs_to :restaurant
  validates_presence_of :rating, :body
end

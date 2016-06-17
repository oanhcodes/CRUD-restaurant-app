class Restaurant < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :reviews
  validates_presence_of :name, :cuisine, :address, :city, :state, :zipcode
end

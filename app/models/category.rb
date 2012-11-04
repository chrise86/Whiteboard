class Category < ActiveRecord::Base
  attr_accessible :name, :userID, :weight
  has_many :events
  belongs_to :user, :foreign_key => :userID
end

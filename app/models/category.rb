class Category < ActiveRecord::Base
  attr_accessible :name, :user_id, :weight
  has_many :events
  belongs_to :user, :foreign_key => :user_id
end

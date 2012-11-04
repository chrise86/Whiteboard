class Question < ActiveRecord::Base
  attr_accessible :description, :eventID, :type
  has_many :multiple_choices
  belongs_to :event, :foreign_key => :eventID
end

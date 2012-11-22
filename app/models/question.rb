class Question < ActiveRecord::Base
  attr_accessible :description, :event_id, :type
  has_many :multiple_choices
  belongs_to :events, :foreign_key => :event_id
end

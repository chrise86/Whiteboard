class Question < ActiveRecord::Base
  attr_accessible :description, :event_id, :category
  has_many :multiple_choices
  belongs_to :event, :foreign_key => :event_id
end

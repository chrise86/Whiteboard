class Event < ActiveRecord::Base
  attr_accessible :attachment, :categoryID, :description, :end, :start, :title
  has_many :gradebooks
  has_many :professor_events
  has_many :questions
  belongs_to :category, :foreign_key => :categoryID
  has_many :section_events
  has_many :sections, :through => :section_events
end

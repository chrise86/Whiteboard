class Course < ActiveRecord::Base
  attr_accessible :name
  has_many :professor_events
  has_many :sections
end

class Section < ActiveRecord::Base
  attr_accessible :courseID, :professor, :sectionNumber, :semesterID
  has_many :gradebooks
  has_many :user_sections
  has_many :users, :through => :user_sections
  has_many :section_events
  has_many :events, :through => :section_events
  belongs_to :course, :foreign_key => :course_id
end

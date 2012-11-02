class Section < ActiveRecord::Base
  attr_accessible :courseID, :professor, :sectionNumber, :semesterID
end

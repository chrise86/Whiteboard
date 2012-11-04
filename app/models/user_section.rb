class UserSection < ActiveRecord::Base
  attr_accessible :grade, :sectionID, :userID
  belongs_to :user, :foreign_key => :userID
  belongs_to :section, :foreign_key => :sectionID
end

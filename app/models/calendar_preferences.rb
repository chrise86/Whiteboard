class CalendarPreferences < ActiveRecord::Base
  attr_accessible :gradesShown, :userID
  belongs_to :user, :foreign_key => :userID
end

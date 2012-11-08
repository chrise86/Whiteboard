class CalendarPreferences < ActiveRecord::Base
  attr_accessible :grades_shown, :user_id
  belongs_to :user, :foreign_key => :user_id
end

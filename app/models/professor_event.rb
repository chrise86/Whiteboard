class ProfessorEvent < ActiveRecord::Base
  attr_accessible :course_id, :event_id, :user_id, :semester_id
  belongs_to :course, :foreign_key => :course_id
  belongs_to :event, :foreign_key => :event_id
  belongs_to :user, :foreign_key => :user_id

  def semester_list
    %w(Spring Summer Fall)
  end

  def date
    "#{semester_list[semester]}, #{year}"
  end

  def semester
    semester_id%3
  end

  def year
    2011 + semester_id/3
  end

end

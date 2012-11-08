class Section < ActiveRecord::Base
  attr_accessible :course_id, :section_number, :semester_id
  has_many :gradebooks
  has_many :user_sections
  has_many :users, :through => :user_sections
  has_many :section_events
  has_many :events, :through => :section_events
  belongs_to :course, :foreign_key => :course_id

  def self.all_for_user(u)
    user_section = UserSection.where(:user_id => u)

    section = []
    user_section.each do |us|
      temp = Section.find_by_id(us.section_id)
      section << temp
    end

    return section
  end
end

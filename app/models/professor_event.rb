class ProfessorEvent < ActiveRecord::Base
  attr_accessible :course_id, :event_id, :user_id
  belongs_to :course, :foreign_key => :course_id
  belongs_to :event, :foreign_key => :event_id
  belongs_to :user, :foreign_key => :user_id

  def self.find_professor_sections(user)
    #find all of the sections under the list of professor courses
    professor_courses = user.find_professor_courses
    course_sections = {}
    professor_courses.each do |course|
      course_sections[course] = Section.where(:course_id => course.id)
    end

    #find all of the user sections under the professor's user ID
    user_sections = user.find_all_sections

    #filter out the sections that the professor actually has
    #for every section in the list of sections extracted from professor courses,
    #compare it to each section in user_section and store the matches in a new list
    #of sections
    courses_sections = {}
    course_sections.each do |course, sections|
      new_sections = []
      sections.each do |a_section|
        user_sections.each do |section|
          new_sections << section if a_section.id.eql?(section.id)
        end
      end
      courses_sections[course] = new_sections
    end
    courses_sections
  end

end

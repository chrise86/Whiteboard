class GradebookController < ApplicationController
  def index
  end
  #creates a new category for a user gradebook
  #def add_category (user_id, weight, name, section_id)
  #  Category.create(:user_id => user_id, :weight => weight, :name => name,:section_id => section_id)
  #end
  #removes the specified category from the gradebook
  #def remove_category (category_id,section_id)
  #  Category.where(:section_id => section_id,:id => category_id).destroy
  #end
  #adds an event to a gradebook
  def add_event(section_id,event_id)
    users = UserSection.where(:section_id => section_id)
    users.each do |u|
      Gradebook.create(:user_id => u.id, :section_id => section_id, :event_id => event_id)
    end
  end
  # removes an event from a gradebook
  def remove_event(event_id)
    Gradebook.where(:event_id => event_id).destroy
  end
  # adds student to a gradebook
  def add_student(user_id,section_id)
    Gradebook.create(:user_id => user_id,:section_id => section_id)
  end
  #removes a student from a gradebook
  def remove_student(user_id,section_id)
    Gradebook.where(:user_id => user_id,:section_id => section_id).destroy
  end
  #calculates the current grade for a specific user in a specific section
  def calculate_grades(user_id)
    test = []
    quiz=[]
    project=[]
    assignment=[]
    user_sections = Section.all_for_user(user_id)
    user_sections.each do |section|
      section_events = Event.all_for_section(section.id)
      section_events.each do |event|
        category_name = Category.where(:id => event.category_id).name
        if category_name.eql? "Test"
          test << event
        elsif category_name.eql? "Quiz"
          quiz << event
        elsif category_name.eql? "Project"
          project << event
        else
          assignment << event
        end
      end
    end
    test_final = (test.inject{:+}/test.size)* 0.25
    quiz_final = (quiz.inject(:+)/quiz.size)* 0.15
    assignment_final = (assignment.inject(:+)/assignment.size)* 0.15
    project_final = (project.inject(:+)/project.size)* 0.45
    final_grade = test_final + quiz_final + assignment_final + project_final
    final grade
  end

end

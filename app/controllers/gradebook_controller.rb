class GradebookController < ApplicationController
  def index
  end
  #creates a new category for a user gradebook
  def add_category (user_id, weight, name)
    Category.create(:user_id => user_id, :weight => weight, :name => name)
  end
  #removes the specified category from the gradebook
  def remove_category (category_id)
    Category.where(:id => category_id).destroy
  end
  #adds an event to a gradebook
  def add_event(title, start_time, end_time, category_id, description, attachment)
    Event.create(:title => title, :start => start_time, :end => end_time,
                 :category_id => category_id, :description => description,
                 :attachment => attachment)
  end
  # removes an event from a gradebook
  def remove_event(event_id)
    Event.where(:id => event_id).destroy
  end
  # adds student to a gradebook
  def add_student(user_id,section_id)
  Gradebook.create(:user_id => user_id)
  end
  #removes a student from a gradebook
  def remove_student(user_id,section_id)
  Gradebook.where(:user_id => user_id,:section_id => section_id).destroy
  end
   #calculates the current grade for a specific user in a specific section
  def calculate_grades(current_userID)
  user_sections = Section.all_for_user(current_userID)
  end
end

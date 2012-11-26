class DragonDropController < ApplicationController
  def add_event_to_section(section_id, event_id)
    SectionEvent.create(section_id: section_id, event_id: event_id)
  end

  def remove_event_from_section(section_event_id)
    SectionEvent.where(:id => section_event_id).destroy
  end

  def add_category(user_id, weight, name)
    Category.create(:user_id => user_id, :weight => weight, :name => name)
  end

  def remove_category(category_id)
    Category.where(:id => category_id).destroy
  end

  def add_event(title, start_time=Time.now, end_time=Time.at_midnight, category_id, description, attachment)
    Event.create(:title => title, :start => start_time, :end => end_time,
                 :category_id => category_id, :description => description,
                 :attachment => attachment)
  end

  def remove_event(event_id)
    Event.where(:id => event_id).destroy
  end

  def change_course(course_id)

  end

  def index
    user = User.first
    respond_with @course_events = user.find_professor_sections_events
  end

  def get_courses
    user = User.first
    respond_with @courses = user.find_professor_courses
  end

  def get_sections
    user = User.first
    respond_with @sections = user.find_professor_sections
  end

  def get_unassigned_events
    user = User.first
    respond_with @unassigned_events = user.find_courses_events
  end

  def get_assigned_events
    user = User.first
    respond_with @assigned_events = user.find_all_sections
  end

end

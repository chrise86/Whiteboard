class DragonDropController < ApplicationController

  respond_to :json, :html

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
    @courses = user.find_professor_courses

    get_sections
    get_unassigned_events(5)
    get_assigned_events(@course.first, 5)
  end

  def test
    index
  end

  def get_sections
    user = User.first
    @assigned_events = user.find_all_sections_and_their_events_formatted
    @sections = user.sections.collect {|section|
      {:section_id => section.id, :section_name => section.long_name}}
  end

  def get_unassigned_events(semester = 1)
    user = User.first
    @unassigned_events = user.find_courses_events(semester)
  end

  def get_assigned_events(course, semester)
    user = User.first
    respond_with @assigned_events = user.find_all_sections_and_their_events(course, semester).collect {|section, events|
    events.each {|event| {section_id: section.id, event_id: event.id}}}
  end

end

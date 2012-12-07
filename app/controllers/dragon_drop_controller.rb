class DragonDropController < ApplicationController

  respond_to :json, :html

  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    # Calculate the first day that appears on the calendar
    @calendar_start_day = @date.beginning_of_week - (@date.beginning_of_week.wday)

    user = User.first
    @courses = user.find_semester_courses(Section.date_to_semester_num(@date))
    @course = params[:course] || @courses.first
    get_unassigned_events(5)
    get_assigned_events(@course, @date)
  end

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

  def get_unassigned_events(semester = 1)
    user = User.first
    @unassigned_events = user.find_courses_events(semester)
  end

  def get_assigned_events(course, date)
    #require "pry";
    user = User.first
    semester = Section.date_to_semester_num(date)
    sections_events = user.find_all_sections_and_their_events(course, semester)
    @sections = sections_events.keys.collect {|section| {:section_id => section.id, :section_name => section.long_name}}
    some_list = @sections.collect {|section| SectionEvent.find_all_by_section_id(section[:section_id])}.flatten
    @assigned_events = some_list.collect {|se|
      {:event_id => se.event_id, :section_id => se.section_id,
       :end_date => se.end_date, :event_title => Event.find_by_id(se.event_id).title}}
    #binding.pry
    respond_with @assigned_events
  end

end

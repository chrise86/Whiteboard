class CalendarController < ApplicationController

  def index
    # Get a user
    @user = User.first

    # Get all the sections for that user
    sections = @user.find_all_sections

    # Get all the section names for those sections

    @section_names = {}
    @sections_events_names = {}
    sections.each do |s|
      @section_names[s] = Course.find_by_id(s.course_id).name
    end

    # Get all the events (in an array) for every section
    events_per_section = {}
    sections.each do |s|
      events_per_section[s.id] = Event.find_all_for_section(s.id)
    end

    @section_names.each do |section, name|
      event_names = []
      events = events_per_section[section.id]
      events.each do |e|
        event_names << "#{e.title}"
      end
      @sections_events_names["#{name.to_s}-#{section.section_number.to_s}"] = event_names
    end

end

end

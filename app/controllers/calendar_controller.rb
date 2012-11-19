class CalendarController < ApplicationController

  def index
    # Get a user
    @user = User.first

    # Get all the sections for that user
    @section = Section.find_all_for_user(@user)

    # Get all the section names for those sections

    @section_names = {}
    @sections_events_names = {}
    @section.each do |s|
      @section_names[s] = Course.find_by_id(s.course_id).name
    end

    # Get all the events (in an array) for every section
    @events_per_section = {}
    @section.each do |s|
      @events_per_section[s.id] = Event.find_all_for_section(s.id)
    end

    @section_names.each do |section, name|
      event_names = []
      events = @events_per_section[section.id]
      events.each do |e|
        event_names << "#{e.title} - Starts at: #{e.start}, Ends at: #{e.end}"
      end
      @sections_events_names["#{name.to_s}-#{section.section_number.to_s}"] = event_names
    end

    #require 'pry'; binding.pry

end

end

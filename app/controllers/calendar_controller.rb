class CalendarController < ApplicationController

  def index
    @calendar_start_day = Date.today.beginning_of_month - (Date.today.beginning_of_month.wday)
    find_a_place_for_this_crap
  end

  # Returns a hash formatted as: { section_id => [event_id, event_id, event_id, etc] }
  def find_a_place_for_this_crap
    # Get a user
    @user = User.first

    # Get all the sections for that user
    sections = @user.find_all_sections

    section_event_hash = []
    sections.each do |s|
      section_event_hash << { s => s.find_all_sections_for_month }
    end

    require "pry"; binding.pry
    #
    #
    ## Get all the section names for those sections
    #@section_names = {}
    #@sections_events_names = {}
    #sections.each do |s|
    #  @section_names[s] = Course.find_by_id(s.course_id).name
    #end
    #
    ## Get all the events (in an array) for every section
    #events_per_section = {}
    #sections.each do |s|
    #  events_per_section[s.id] = Event.find_all_for_section(s.id)
    #end
    #
    #@section_names.each do |section, name|
    #  event_names = []
    #  events = events_per_section[section.id]
    #  events.each do |e|
    #    event_names << "#{e.id}"
    #  end
    #  @sections_events_names["#{section.id}"] = event_names
    #end

  end

end

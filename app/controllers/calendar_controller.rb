class CalendarController < ApplicationController

  def index
    # Get a user
    @user = User.first

    # Get all the sections for that user
    @section = Section.find_all_for_user(@user)

    # Get all the section names for those sections

    @section_names = []
    @section.each do |s|
      @section_names << Course.find_by_id(s.course_id).name
    end


    # Get all the events (in an array) for every section
    @events_per_section = {}
    @section.each do |s|
      @events_per_section[s.name] = SectionEvent.where(:section_id => s.id)
    end



    #require 'pry'; binding.pry

  end

end

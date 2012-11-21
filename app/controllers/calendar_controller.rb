class CalendarController < ApplicationController

  def index
    @calendar_start_day = Date.today.beginning_of_month - (Date.today.beginning_of_month.wday)
    @section_events = find_a_place_for_this_crap
  end

  # Returns a hash formatted as: { section => [event, event, event, etc] }
  def find_a_place_for_this_crap
    # Get a user
    @user = User.first

    # Get all the sections for that user
    sections = @user.find_all_sections

    # Format the array of hashes as: { section => [event, event, event, etc] }
    sections.map { |s| {s => s.find_all_events} }

  end

end

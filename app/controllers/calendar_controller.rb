class CalendarController < ApplicationController

  respond_to :json

  def index
    params[:date] ||= Date.today

    # Calculate the first day that appears on the calendar
    @calendar_start_day = params[:date].beginning_of_month - (Date.today.beginning_of_month.wday)

    # Get all sections and events
    @sections_and_events = User.first.find_all_sections_and_their_events_formatted#.collect { |s_and_es| { id: s_and_es.id, name: s_and_es } }

    # Filter to the current month only
    @sections_and_events.select! { |i| i[:end_date] > @calendar_start_day and i[:end_date] < (@calendar_start_day + 35.days) }

    # Sort by date
    @sections_and_events.sort { |a, b| a[:end_date] <=> b[:end_date] }


  end

  # Returns a hash formatted as: { section => [events, events, events, etc] }
  #def get_section_events_pairs
  #  # Get a user
  #  @user = User.first
  #  respond_with @user.find_all_sections_and_their_events.collect { |s_and_es| { id: s_and_es.id, name: s_and_es } }
  #end

end

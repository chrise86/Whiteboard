class CalendarController < ApplicationController

  respond_to :json

  def index
    @calendar_start_day = Date.today.beginning_of_month - (Date.today.beginning_of_month.wday)
  end

  # Returns a hash formatted as: { section => [events, events, events, etc] }
  def get_section_events_pairs
    # Get a user
    @user = User.first
    require "pry"; binding.pry;

    respond_with @user.find_all_sections_and_their_events.map { |s_and_es| { id: s_and_es.id, name: s_and_es } }
  end

end

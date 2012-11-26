class CalendarController < ApplicationController

  respond_to :json

  def index
    @calendar_start_day = Date.today.beginning_of_month - (Date.today.beginning_of_month.wday)
  end

  # Returns a hash formatted as: { section => [events, events, events, etc] }
  def get_section_events_pairs
    # Get a user
    @user = User.first
    x = @user.find_all_sections_and_their_events_formatted

    respond_with x
  end

end

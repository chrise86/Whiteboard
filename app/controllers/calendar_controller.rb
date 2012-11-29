class CalendarController < ApplicationController

  def index
    params[:date] ||= Date.today

    # Calculate the first day that appears on the calendar
    @calendar_start_day = params[:date].beginning_of_month - (Date.today.beginning_of_month.wday)

    # Get all sections and events
    @sections_and_events = User.first.find_all_sections_and_their_events_formatted

    # Filter to the current month only
    @sections_and_events.select! { |i| i[:end_date] > @calendar_start_day and i[:end_date] < (@calendar_start_day + 35.days) }

    # Sort by date
    @sections_and_events.sort { |a, b| a[:end_date] <=> b[:end_date] }

    # Month string
    @month = params[:date].strftime("%B %Y")

    # Event div colors
    div_colors = %w(#ff7f50 #5f9ea0 #adff2f #afeeee #ffd700)

    # Section tags for CSS. The "reduce" method is used to turn this:
    # => [{"ITEC3101"=>"#ff7f50"}, {"ITEC2401"=>"#5f9ea0"}, {"ITEC1401"=>"#adff2f"}, {"ITEC1001"=>"#afeeee"}]
    # into this:
    # => {"ITEC3101"=>"#ff7f50", "ITEC2401"=>"#5f9ea0", "ITEC1401"=>"#adff2f", "ITEC1001"=>"#afeeee"}
    # More information here: http://stackoverflow.com/questions/10943909/array-of-hashes-to-hash

    @course_styles = @sections_and_events.collect { |a| a[:course_name] }.uniq.collect.with_index { |c, i| { c => div_colors[i] } }.reduce Hash.new, :update
  end

  # Returns a hash formatted as: { section => [events, events, events, etc] }
  #def get_section_events_pairs
  #  # Get a user
  #  @user = User.first
  #  respond_with @user.find_all_sections_and_their_events.collect { |s_and_es| { id: s_and_es.id, name: s_and_es } }
  #end

end

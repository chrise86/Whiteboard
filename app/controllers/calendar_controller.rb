class CalendarController < ApplicationController
  def index
    @user = User.first
    @user_section = UserSection.where(:user_id => @user.id) { |x| x }


    @section = []
    @user_section.each do |us|
      temp = Section.find_by_id(us.section_id)
      @section << temp
    end

    #@section = @section.reject { |x| x.nil? }

  end
end

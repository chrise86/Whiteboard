class CalendarController < ApplicationController
  def index
    @user = User.first

    @section = Section.all_for_user(@user)



  end
end

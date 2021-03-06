class EventsController < ApplicationController
  #used to create a new event

  respond_to :json

def create
  #require "pry"; binding.pry
  @event = Event.new(params[:event])
  if @event.save
    render :text => "It saved! :D"
  else
    render :text => "It didn't save! :("
  end
end

def new
  @event = Event.new


end

def add_question
  #data is passed in in the form from ajax as params[:variable name]through ajax to the database
  Question.create(params[:event_id], params[:question_id], params[:description], params[:choice_1], params[:choice_2], params[:choice_3], params[:choice_4], params[:answer])
end

def remove_question
  #removes the question from the database, simply just calls a query command
  Question.where(:id => params[:id]).destroy
end

def add_new_download
  #takes in a uploaded file from the gui
  #will be added later
end

def remove_download
  #takes in a uploaded file from the gui
  #will be added later
end

  def show
    params[:event_id] ||= 1
    params[:section_id] ||= 1

    #shows an events
    @event = Event.find_by_id(params[:event_id])
    @section_event = SectionEvent.where(:section_id => params[:section_id], :event_id => params[:event_id]).first
    @professor_event = ProfessorEvent.where(:event_id => params[:event_id]).first
    @professor = User.find_by_id(@professor_event.user_id) if @professor_event

    response = {
        :title => @event.title,
        :professor => @professor ? @professor.first_name + " " + @professor.last_name : "No professor available",
        :description => !@event.description.blank? ? @event.description : "No description provided.",
        :due_date => @section_event.end_date.strftime("%A, %b %d %Y")
    }

    respond_with response
  end

end

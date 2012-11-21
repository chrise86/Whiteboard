class EventsController < ApplicationController
  #used to create a new events

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

def show(id=1)
  #shows an events
  @event = Event.find_by_id(id)
end

end

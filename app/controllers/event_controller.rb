class EventController < ApplicationController
  #used to create a new event

  def add_question(question_id = 1)
    #adds the question from the question text field on the assessment creator
    Question.where(:id => question_id)
  end


def remove_question
  #removes the question
end

def add_choice_1
  #adds choice 1
end

def add_choice_2
  #adds choice 2
end

def add_choice_3
  #adds choice 3
end

def add_choice_4
  #adds choice 4
end

def add_answer
  #adds answer
end

def add_new_download
  #will be added later
end

def remove_download
  #will be added later
end

def grade_event
end

def show
end

end

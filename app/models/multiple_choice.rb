class MultipleChoice < ActiveRecord::Base
  attr_accessible :question_id, :answer, :choice_1, :choice_2, :choice_3, :choice_4
  has_many :user_responses
  belongs_to :question, :foreign_key => :question_id
end
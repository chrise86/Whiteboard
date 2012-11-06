class UserSection < ActiveRecord::Base
  attr_accessible :grade, :section_id, :user_id
  belongs_to :user, :foreign_key => :user_id
  belongs_to :section, :foreign_key => :section_id
end

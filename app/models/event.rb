class Event < ActiveRecord::Base
  attr_accessible :attachment, :categoryID, :description, :end, :start, :title
end

class Event < ActiveRecord::Base
  attr_accessible :attachment, :category_id, :description, :end, :start, :title
  has_many :gradebooks
  has_many :professor_events
  has_many :questions
  belongs_to :category, :foreign_key => :category_id
  has_many :section_events
  has_many :sections, :through => :section_events

  def self.find_all_for_section(section_id)
    section_events = SectionEvent.where(:section_id => section_id)

    events = []
    section_events.each do |section_event|
      temp = Event.find_by_id(section_event.event_id)
      events << temp
    end
    events
  end

  def self.grade_weight(section_id)
    category_id = Section.category_id
    category = Category.find_by_id(category_id)
    category.weight
  end

end

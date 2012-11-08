class DragonDropController < ApplicationController
  def add_event_to_section(section_id, event_id)
    SectionEvent.create(section_id: section_id, event_id: event_id)
  end

  def remove_event_from_section(section_event_id)
    SectionEvent.where(:id => section_event_id).destroy
  end

  def add_category(user_id, weight, name)
    Category.create(:user_id => user_id, :weight => weight, :name => name)
  end

  def remove_category(category_id)
    Category.where(:id => category_id).destroy
  end

  def add_event(title, start_time, end_time, category_id, description, attachment)
    Event.create(:title => title, :start => start_time, :end => end_time,
                 :category_id => category_id, :description => description,
                 :attachment => attachment)
  end

  def remove_event(event_id)
    Event.where(:id => event_id).destroy
  end

  def change_course(course_id)

  end

  def show(user_id = User.first)
    course_sections = Section.user_course_sections(user_id)
    #Organize the data so that it can be gotten on the web page.
  end



end

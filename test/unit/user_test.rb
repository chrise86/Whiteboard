require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "find_all_sections should return an array of all the sections a user belongs to" do
    mock_user = User.create(id: 1, first_name: "Derek", last_name: "Cannon")
    mock_section = Section.create(id: 1)

    mock_user_section = UserSection.create(id: 1, section_id: 1, user_id: 1)

    mock_events = []
    10.times do |i|
      mock_events << Event.create(id: i, title: "Mock Event #{i}", section: 1)
    end

    mock_section_event = []
    10.times do |i|
      mock_section_event << SectionEvent.create(id: i, event_id: mock_events[i].id, section_id:1)
    end

  end

end

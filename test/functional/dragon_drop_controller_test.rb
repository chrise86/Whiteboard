require 'test_helper'

class DragonDropControllerTest < ActionController::TestCase
  test "should get add_event_to_section" do
    get :add_event_to_section
    assert_response :success
  end

  test "should get remove_event_from_section" do
    get :remove_event_from_section
    assert_response :success
  end

  test "should get add_category" do
    get :add_category
    assert_response :success
  end

  test "should get remove_category" do
    get :remove_category
    assert_response :success
  end

  test "should get add_event" do
    get :add_event
    assert_response :success
  end

  test "should get remove_event" do
    get :remove_event
    assert_response :success
  end

  test "should get change_course" do
    get :change_course
    assert_response :success
  end

end

require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should get add_question" do
    get :add_question
    assert_response :success
  end

  test "should get remove_question" do
    get :remove_question
    assert_response :success
  end

  test "should get add_new_download" do
    get :add_new_download
    assert_response :success
  end

  test "should get remove_download" do
    get :remove_download
    assert_response :success
  end

  test "should get grade_event" do
    get :grade_event
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end

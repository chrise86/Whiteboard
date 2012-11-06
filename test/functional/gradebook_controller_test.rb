require 'test_helper'

class GradebookControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
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

  test "should get add_student" do
    get :add_student
    assert_response :success
  end

  test "should get remove_student" do
    get :remove_student
    assert_response :success
  end

  test "should get calculate_grades" do
    get :calculate_grades
    assert_response :success
  end

end

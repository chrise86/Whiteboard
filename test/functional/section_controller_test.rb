require 'test_helper'

class SectionControllerTest < ActionController::TestCase
  test "should get add_student" do
    get :add_student
    assert_response :success
  end

  test "should get remove_student" do
    get :remove_student
    assert_response :success
  end

  test "should get add_assignment" do
    get :add_assignment
    assert_response :success
  end

  test "should get remove_assignment" do
    get :remove_assignment
    assert_response :success
  end

  test "should get add_content" do
    get :add_content
    assert_response :success
  end

  test "should get remove_content" do
    get :remove_content
    assert_response :success
  end

  test "should get add_professor" do
    get :add_professor
    assert_response :success
  end

  test "should get remove_professor" do
    get :remove_professor
    assert_response :success
  end

end

require 'test_helper'

class ExamlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @examlist = examlists(:one)
  end

  test "should get index" do
    get examlists_url
    assert_response :success
  end

  test "should get new" do
    get new_examlist_url
    assert_response :success
  end

  test "should create examlist" do
    assert_difference('Examlist.count') do
      post examlists_url, params: { examlist: { examination_id: @examlist.examination_id, mark: @examlist.mark, student_id: @examlist.student_id } }
    end

    assert_redirected_to examlist_url(Examlist.last)
  end

  test "should show examlist" do
    get examlist_url(@examlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_examlist_url(@examlist)
    assert_response :success
  end

  test "should update examlist" do
    patch examlist_url(@examlist), params: { examlist: { examination_id: @examlist.examination_id, mark: @examlist.mark, student_id: @examlist.student_id } }
    assert_redirected_to examlist_url(@examlist)
  end

  test "should destroy examlist" do
    assert_difference('Examlist.count', -1) do
      delete examlist_url(@examlist)
    end

    assert_redirected_to examlists_url
  end
end

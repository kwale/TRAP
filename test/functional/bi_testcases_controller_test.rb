require 'test_helper'

class BiTestcasesControllerTest < ActionController::TestCase
  setup do
    @bi_testcase = bi_testcases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bi_testcases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bi_testcase" do
    assert_difference('BiTestcase.count') do
      post :create, bi_testcase: { release: @bi_testcase.release, status: @bi_testcase.status, suite_id: @bi_testcase.suite_id, tag: @bi_testcase.tag, test_case_id: @bi_testcase.test_case_id, time: @bi_testcase.time, timestamp: @bi_testcase.timestamp }
    end

    assert_redirected_to bi_testcase_path(assigns(:bi_testcase))
  end

  test "should show bi_testcase" do
    get :show, id: @bi_testcase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bi_testcase
    assert_response :success
  end

  test "should update bi_testcase" do
    put :update, id: @bi_testcase, bi_testcase: { release: @bi_testcase.release, status: @bi_testcase.status, suite_id: @bi_testcase.suite_id, tag: @bi_testcase.tag, test_case_id: @bi_testcase.test_case_id, time: @bi_testcase.time, timestamp: @bi_testcase.timestamp }
    assert_redirected_to bi_testcase_path(assigns(:bi_testcase))
  end

  test "should destroy bi_testcase" do
    assert_difference('BiTestcase.count', -1) do
      delete :destroy, id: @bi_testcase
    end

    assert_redirected_to bi_testcases_path
  end
end

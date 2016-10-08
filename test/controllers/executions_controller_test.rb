require 'test_helper'

class ExecutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @execution = executions(:one)
  end

  test "should get index" do
    get executions_url
    assert_response :success
  end

  test "should get new" do
    get new_execution_url
    assert_response :success
  end

  test "should create execution" do
    assert_difference('Execution.count') do
      post executions_url, params: { execution: { execute_datetime: @execution.execute_datetime, kind: @execution.kind } }
    end

    assert_redirected_to execution_url(Execution.last)
  end

  test "should show execution" do
    get execution_url(@execution)
    assert_response :success
  end

  test "should get edit" do
    get edit_execution_url(@execution)
    assert_response :success
  end

  test "should update execution" do
    patch execution_url(@execution), params: { execution: { execute_datetime: @execution.execute_datetime, kind: @execution.kind } }
    assert_redirected_to execution_url(@execution)
  end

  test "should destroy execution" do
    assert_difference('Execution.count', -1) do
      delete execution_url(@execution)
    end

    assert_redirected_to executions_url
  end
end

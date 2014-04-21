require 'test_helper'

class QvotesControllerTest < ActionController::TestCase
  setup do
    @qvote = qvotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qvotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qvote" do
    assert_difference('Qvote.count') do
      post :create, qvote: { question_id: @qvote.question_id, user_id: @qvote.user_id }
    end

    assert_redirected_to qvote_path(assigns(:qvote))
  end

  test "should show qvote" do
    get :show, id: @qvote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qvote
    assert_response :success
  end

  test "should update qvote" do
    patch :update, id: @qvote, qvote: { question_id: @qvote.question_id, user_id: @qvote.user_id }
    assert_redirected_to qvote_path(assigns(:qvote))
  end

  test "should destroy qvote" do
    assert_difference('Qvote.count', -1) do
      delete :destroy, id: @qvote
    end

    assert_redirected_to qvotes_path
  end
end

require 'test_helper'

class AvotesControllerTest < ActionController::TestCase
  setup do
    @avote = avotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:avotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create avote" do
    assert_difference('Avote.count') do
      post :create, avote: { answer_id: @avote.answer_id, user_id: @avote.user_id }
    end

    assert_redirected_to avote_path(assigns(:avote))
  end

  test "should show avote" do
    get :show, id: @avote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @avote
    assert_response :success
  end

  test "should update avote" do
    patch :update, id: @avote, avote: { answer_id: @avote.answer_id, user_id: @avote.user_id }
    assert_redirected_to avote_path(assigns(:avote))
  end

  test "should destroy avote" do
    assert_difference('Avote.count', -1) do
      delete :destroy, id: @avote
    end

    assert_redirected_to avotes_path
  end
end

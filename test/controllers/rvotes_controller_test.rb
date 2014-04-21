require 'test_helper'

class RvotesControllerTest < ActionController::TestCase
  setup do
    @rvote = rvotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rvotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rvote" do
    assert_difference('Rvote.count') do
      post :create, rvote: { review_id: @rvote.review_id, user_id: @rvote.user_id }
    end

    assert_redirected_to rvote_path(assigns(:rvote))
  end

  test "should show rvote" do
    get :show, id: @rvote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rvote
    assert_response :success
  end

  test "should update rvote" do
    patch :update, id: @rvote, rvote: { review_id: @rvote.review_id, user_id: @rvote.user_id }
    assert_redirected_to rvote_path(assigns(:rvote))
  end

  test "should destroy rvote" do
    assert_difference('Rvote.count', -1) do
      delete :destroy, id: @rvote
    end

    assert_redirected_to rvotes_path
  end
end

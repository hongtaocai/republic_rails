require 'test_helper'

class VoteactionsControllerTest < ActionController::TestCase
  setup do
    @voteaction = voteactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voteactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voteaction" do
    assert_difference('Voteaction.count') do
      post :create, voteaction: {  }
    end

    assert_redirected_to voteaction_path(assigns(:voteaction))
  end

  test "should show voteaction" do
    get :show, id: @voteaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @voteaction
    assert_response :success
  end

  test "should update voteaction" do
    patch :update, id: @voteaction, voteaction: {  }
    assert_redirected_to voteaction_path(assigns(:voteaction))
  end

  test "should destroy voteaction" do
    assert_difference('Voteaction.count', -1) do
      delete :destroy, id: @voteaction
    end

    assert_redirected_to voteactions_path
  end
end

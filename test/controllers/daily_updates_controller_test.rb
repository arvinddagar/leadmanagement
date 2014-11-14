require 'test_helper'

class DailyUpdatesControllerTest < ActionController::TestCase
  setup do
    @daily_update = daily_updates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daily_updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daily_update" do
    assert_difference('DailyUpdate.count') do
      post :create, daily_update: { address: @daily_update.address, business: @daily_update.business, contact_person: @daily_update.contact_person, designation: @daily_update.designation, email: @daily_update.email, number: @daily_update.number, status: @daily_update.status, summary: @daily_update.summary }
    end

    assert_redirected_to daily_update_path(assigns(:daily_update))
  end

  test "should show daily_update" do
    get :show, id: @daily_update
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daily_update
    assert_response :success
  end

  test "should update daily_update" do
    patch :update, id: @daily_update, daily_update: { address: @daily_update.address, business: @daily_update.business, contact_person: @daily_update.contact_person, designation: @daily_update.designation, email: @daily_update.email, number: @daily_update.number, status: @daily_update.status, summary: @daily_update.summary }
    assert_redirected_to daily_update_path(assigns(:daily_update))
  end

  test "should destroy daily_update" do
    assert_difference('DailyUpdate.count', -1) do
      delete :destroy, id: @daily_update
    end

    assert_redirected_to daily_updates_path
  end
end

require 'test_helper'

class TeamsControllerTest < ActionController::TestCase

  self.use_instantiated_fixtures = false

  setup do
    @team = teams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not create team with only one member" do
    assert_no_difference('Team.count') do
      params = { :team => { :name => 'Team Zero', :members_attributes => [
        { :name => 'Mr Zero', :email => 'mrzero@myzeroemail.com', 
          :github => 'mrsuperzero' }
      ]}}
      post :create, team: params[:team]
    end

    #assert_response :error

    #assert_redirected_to team_path(assigns(:team))
  end

  test "should create team with two members" do
    assert_difference('Team.count') do
    params = { :team => { :name => 'Team Zero', :members_attributes => [
      { :name => 'Mr Zero', :email => 'mrzero@myzeroemail.com', 
        :github => 'mrsuperzero' },
      { :name => 'Mr One', :email => 'mrone@myoneemail.com', 
        :github => 'mrsuperone' }
    ]}}
      post :create, team: params[:team]
    end

    assert_redirected_to team_path
  end

  test "should show team" do
    get :show, id: @team
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team
    assert_response :success
  end

  test "should update team" do
    put :update, id: @team, team: @team.attributes
    assert_redirected_to team_path(assigns(:team))
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete :destroy, id: @team
    end

    assert_redirected_to teams_path
  end
end

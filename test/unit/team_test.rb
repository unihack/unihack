require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "should not create team when email is not unique" do
    params = { :team => { :name => 'Team Zero', :members_attributes => [
      { :name => 'Mr Zero', :email => 'mrzero@myzeroemail.com', 
        :github => 'mrsuperzero1' },
      { :name => 'Mr Zero', :email => 'mrzero@myzeroemail.com', 
        :github => 'mrsuperzero2' }
    ]}}
    team = Team.new(params[:team])

    assert !team.valid?
  end

  test "should not create team when github is not unique" do
    params = { :team => { :name => 'Team Zero', :members_attributes => [
      { :name => 'Mr Zero', :email => 'mrzero1@myzeroemail.com', 
        :github => 'mrsuperzero' },
      { :name => 'Mr Zero', :email => 'mrzero2@myzeroemail.com', 
        :github => 'mrsuperzero' }
    ]}}
    team = Team.new(params[:team])

    assert !team.valid?
  end

  test "should not create team with only one member" do
    params = { :team => { :name => 'Team Zero', :members_attributes => [
      { :name => 'Mr Zero', :email => 'mrzero@myzeroemail.com', 
        :github => 'mrsuperzero' }
    ]}}
    team = Team.new(params[:team])

    assert !team.valid?
  end

  test "should create team with two members" do
    params = { :team => { :name => 'Team Zero', :members_attributes => [
      { :name => 'Mr Zero', :email => 'mrzero@myzeroemail.com', 
        :github => 'mrsuperzero' },
      { :name => 'Mr One', :email => 'mrone@myoneemail.com', 
        :github => 'mrsuperone' }
    ]}}
    team = Team.new(params[:team])

    assert team.valid?
  end

  test "should not create team with more than four members" do
    params = { :team => { :name => 'Team Zero', :members_attributes => [
      { :name => 'Mr Zero', :email => 'mrzero@myzeroemail.com', 
        :github => 'mrsuperzero' },
      { :name => 'Mr One', :email => 'mrone@myoneemail.com', 
        :github => 'mrsuperone' },
      { :name => 'Mr Two', :email => 'mrtwo@mytwoemail.com', 
        :github => 'mrsupertwo' },
      { :name => 'Mr Three', :email => 'mrone@mythreeemail.com', 
        :github => 'mrsuperthree' },
      { :name => 'Mr Four', :email => 'mrone@myfouremail.com', 
        :github => 'mrsuperfour' }
    ]}}
    team = Team.new(params[:team])

    assert !team.valid?
  end
end

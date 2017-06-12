class UsersController < ApplicationController
  
  def show
    @goals = current_user.goals
    # @activities = @goals.goal_activities.all
  end
end
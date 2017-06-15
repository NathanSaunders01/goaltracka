class UsersController < ApplicationController
  
  def show
    @goals = current_user.goals
    @activities = current_user.activities.order('created_at DESC')
  end
  
  def dashboard
    @goals = current_user.goals
  end
end
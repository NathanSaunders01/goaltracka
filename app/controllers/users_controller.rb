class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def show
    @goals = current_user.goals
    @activities = current_user.activities.all.reverse
  end
  
  def dashboard
    @goals = current_user.goals
    @activities = current_user.activities.all.reverse
    @table_today_goals = @goals.order("#{sort_column} #{sort_direction}")
    @table_total_goals = @goals.order("#{sort_column} #{sort_direction}")
  end
  
  private 
  
  def sortable_columns
  ["xp", "xp_today", "total_goal_xp"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
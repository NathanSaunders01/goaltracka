class GoalsController < ApplicationController
  before_action :set_goal, only: [:edit, :update, :show, :destroy]
  
  def new
    @goal = Goal.new
  end
  
  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      flash[:success] = "Your goal has been created!"
      redirect_to goals_path
    else
      flash[:danger] = Goal.errors.full_message.join(" ,")
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @goal.update(goal_params)
      flash[:success] = "Goal was successfully updated"
      redirect_to goal_path(@goal)
    else
      flash[:danger] = Goal.errors.full_message.join(" ,")
      render 'edit'
    end
  end
  
  def show
    @total_goal_xp = @goal.total_goal_xp
    @goal_activities = @goal.activities.all.reverse
  end
  
  def index
    @user = current_user
    @user_goals = @user.goals
  end
  
  def destroy
    @goal.destroy
    flash[:danger] = "Goal was successfully deleted"
    redirect_to goals_path
  end

  private
  def goal_params
    params.require(:goal).permit(:name, :xp, :total_goal_xp, :description)
  end
  
  def set_goal
    @goal = Goal.find(params[:id])
  end
  
  def require_same_user
    if @goal.user != current_user or !current_user.admin?
      flash[:danger] = "You can only view your own goals"
      redirect_to root_path
    end
  end
end
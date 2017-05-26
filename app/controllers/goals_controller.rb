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
  end
  
  def show
  end
  
  def index
    @user = current_user
    @user_goals = @user.goals
  end
  
  private
  def goal_params
    params.require(:goal).permit(:name, :xp)
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
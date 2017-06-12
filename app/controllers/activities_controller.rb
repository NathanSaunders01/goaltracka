class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
    @goal = Goal.find(params[:goal_id])
  end

  # GET /activities/1/edit
  def edit
    @goal = Goal.find(params[:goal_id])
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)
    @activity.goal = Goal.find(params[:goal_id])
    if @activity.save
      flash[:success] = "You just gained #{@activity.quantity*@activity.goal.xp}xp!"
      redirect_to goal_path(@activity.goal)
    else
      redirect_to new_goal_activity_path(@goal)
      flash[:danger] = "There was a problem logging your activity"
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    @goal = Goal.find(params[:goal_id])
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      flash[:success] = "Activity was successfully updated"
      redirect_to goal_path(@activity.goal)
    else
      flash[:danger] = "There was a problem updating your activity"
      render 'edit'
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @goal = Goal.find(params[:goal_id])
    @activity.destroy
      flash[:danger] = "Activity was successfully deleted"
      redirect_to goal_path(@activity.goal)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end
    
    def set_goal
      @goal = Goal.find(params[:goal_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:quantity, :goal_id)
    end
end

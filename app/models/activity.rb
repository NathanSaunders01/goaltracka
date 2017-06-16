class Activity < ActiveRecord::Base
  has_many :goal_activities, dependent: :destroy
  belongs_to :goal
  belongs_to :user
  
  after_create :set_total_xp
  after_destroy :reset_total_xp
  
  private
  
  def set_total_xp
    goal_activity = self.goal_activities.where(goal_id: goal_id).first_or_initialize
    goal_activity.update_attribute(:total_xp, (quantity*goal.xp))
    goal = Goal.find_by_id(goal_id)
    todays_goals = goal.goal_activities.where("created_at >= ?", Time.zone.now.beginning_of_day)
    user = goal.user
    goal.update_attribute(:total_goal_xp, goal.goal_activities.sum(:total_xp))
    goal.update_attribute(:xp_today, todays_goals.sum(:total_xp))
    user.update_attribute(:user_xp_today, user.goals.sum(:xp_today))
    user.update_attribute(:total_user_xp, user.goals.sum(:total_goal_xp))
  end
  
  def reset_total_xp
    goal = Goal.find_by_id(goal_id)
    todays_goals = goal.goal_activities.where("created_at >= ?", Time.zone.now.beginning_of_day)
    user = goal.user
    goal.update_attribute(:total_goal_xp, goal.goal_activities.sum(:total_xp))
    goal.update_attribute(:xp_today, todays_goals.sum(:total_xp))
    user.update_attribute(:user_xp_today, user.goals.sum(:xp_today))
    user.update_attribute(:total_user_xp, user.goals.sum(:total_goal_xp))
  end
  

  
  # def set_total_xp
  #   goal_activity = self.goal_activities.where(goal_id: goal_id).first_or_initialize
  #   goal_activity.update_attribute(:total_xp, (quantity*goal.xp))
  #   goal = Goal.find_by_id(goal_id)
  #   xp = goal_activity.total_xp
  #   goal.update_attribute(:total_goal_xp, (goal.total_goal_xp + xp))
  #   user = goal.user
  #   user.update_attribute(:total_user_xp, (user.total_user_xp + xp))
  # end
end

  # def self.set_xp_today
  #   goal_activities = Goal.goal_activities.where("created_at >= ?", Time.zone.now.beginning_of_day).sum(:total_xp)
  #   self.update_attribute(:xp_today, goal.goal_activities.sum(:total_xp))
  # end
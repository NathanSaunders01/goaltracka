class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :goal_activities, dependent: :destroy
  has_many :activities, through: :goal_activities
  
  after_destroy :reset_total_user_xp
  after_commit :reset_goal_xp, on: :update
  after_find :set_daily_xp
  
  private
  
  def reset_total_user_xp
    user = self.user
    user.update_attribute(:total_user_xp, user.goals.sum(:total_goal_xp))
  end
  
  def reset_goal_xp
    self.update_attribute(:total_goal_xp, self.goal_activities.sum(:total_xp))
  end 
  
  def set_daily_xp
    todays_goals = self.goal_activities.where("created_at >= ?", Time.zone.now.beginning_of_day)
    self.update_column(:xp_today, todays_goals.sum(:total_xp))
  end

end
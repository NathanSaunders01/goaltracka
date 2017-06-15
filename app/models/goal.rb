class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :goal_activities
  has_many :activities, through: :goal_activities
  
  after_destroy :reset_total_user_xp
  after_commit :reset_goal_xp, on: :update
  
  def xp_today
    self.goal_activities.where("created_at >= ?", Time.zone.now.beginning_of_day).sum(:total_xp)
  end
  
  private
  
  def reset_total_user_xp
    user = self.user
    user.update_attribute(:total_user_xp, user.goals.sum(:total_goal_xp))
  end
  
  def reset_goal_xp
    self.update_attribute(:total_goal_xp, self.goal_activities.sum(:total_xp))
  end
end
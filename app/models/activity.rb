class Activity < ActiveRecord::Base
  has_many :goal_activities, dependent: :destroy
  belongs_to :goal
  
  after_create :set_total_xp
  
  private
  
  def set_total_xp
    goal_activity = self.goal_activities.where(goal_id: goal_id).first_or_initialize
    goal_activity.update_attribute(:total_xp, (quantity*goal.xp))
  end
end

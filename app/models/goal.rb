class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :goal_activities
  has_many :activities, through: :goal_activities
  
  def total_goal_xp
    self.total_goal_xp = self.goal_activities.sum(:total_xp)
  end 
end
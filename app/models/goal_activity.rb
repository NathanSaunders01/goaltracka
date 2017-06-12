class GoalActivity < ActiveRecord::Base
  belongs_to :goal
  belongs_to :activity
  belongs_to :user
  
  # def self.total_grouped_by_day(start)
  #   goal_activities = where(created_at: start.beginning_of_the_day..Time.zone.now)
  #   goal_activities = goal_activities.group("date(created_at)")
  #   goal_activities = goal_activities.select("created_at, sum(:total_xp) as total_day_xp")
  #   goal_activities.group_by { |g| g.created_at.to_date }
  # end
  
  def xp_today
    goal = Goal.find_by_id(goal_id)
    goal.goal_activities.where("DAY(created_at) = ?", DateTime.now.day).sum(:total_xp)
  end
end
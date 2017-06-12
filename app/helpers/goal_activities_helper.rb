module GoalActivitiesHelper
  
  # def goal_activity_chart_data(start = 4.weeks.ago)
  #   xp_by_day = GoalActivity.total_grouped_by_day(start)
  #   (start.to_date..Date.today).map do |date|
  #     {
  #       created_at: date,
  #       xp: xp_by_day[date].first.try(:total_day_xp) || 0
  #     }
  #   end
  # end  
end
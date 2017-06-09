class GoalActivity < ActiveRecord::Base
  belongs_to :goal
  belongs_to :activity
  
end
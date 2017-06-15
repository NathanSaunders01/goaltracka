module GoalsHelper
  def goal_level
    if @goal.total_goal_xp >= (@goal.xp*200)
      "Completed it m8".html_safe
    elsif  @goal.total_goal_xp >= (@goal.xp*100)
      "5 (#{(@goal.xp*200-@goal.total_goal_xp)}xp to Level 6)".html_safe
    elsif @goal.total_goal_xp >= (@goal.xp*50)
      "4 (#{(@goal.xp*100-@goal.total_goal_xp)}xp to Level 5)".html_safe
    elsif @goal.total_goal_xp >= (@goal.xp*25)
      "3 (#{(@goal.xp*50-@goal.total_goal_xp)}xp to Level 4)".html_safe
    elsif @goal.total_goal_xp >= (@goal.xp*5)
      "2 (#{(@goal.xp*25-@goal.total_goal_xp)}xp to Level 3)".html_safe
    else
      "1 (#{(@goal.xp*5-@goal.total_goal_xp)}xp to Level 2)".html_safe
    end
  end
  
  def goal_level_set_difference
    if @goal.total_goal_xp >= (@goal.xp*200)
      " - Completed it m8".html_safe
    elsif  @goal.total_goal_xp >= (@goal.xp*100)
      "Only #{pluralize(((@goal.xp*200-@goal.total_goal_xp)/@goal.xp), "set")} to level up!".html_safe
    elsif @goal.total_goal_xp >= (@goal.xp*50)
      "Only #{pluralize(((@goal.xp*100-@goal.total_goal_xp)/@goal.xp), "set")} to level up!".html_safe
    elsif @goal.total_goal_xp >= (@goal.xp*25)
      "Only #{pluralize(((@goal.xp*50-@goal.total_goal_xp)/@goal.xp), "set")} to level up!".html_safe
    elsif @goal.total_goal_xp >= (@goal.xp*5)
      "Only #{pluralize(((@goal.xp*25-@goal.total_goal_xp)/@goal.xp), "set")} to level up!".html_safe
    else
      "Only #{pluralize(((@goal.xp*5-@goal.total_goal_xp)/@goal.xp), "set")} to level up!".html_safe
    end
  end
  
  def goal_chart_range
    if @goal.total_goal_xp >= (@goal.xp*200)
      "#{@goal.xp*500}".html_safe
    elsif  @goal.total_goal_xp >= (@goal.xp*100)
      "#{@goal.xp*200}".html_safe
    elsif @goal.total_goal_xp >= (@goal.xp*50)
      "#{@goal.xp*100}".html_safe
    elsif @goal.total_goal_xp >= (@goal.xp*25)
      "#{@goal.xp*50}".html_safe
    elsif @goal.total_goal_xp >= (@goal.xp*5)
      "#{@goal.xp*25}".html_safe
    else
      "#{@goal.xp*5}".html_safe
    end
  end
end
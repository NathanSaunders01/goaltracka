class PagesController < ApplicationController

def home
  if user_signed_in?
    @goals = current_user.goals
    @activities = current_user.activities
  end
end

def about
end

end

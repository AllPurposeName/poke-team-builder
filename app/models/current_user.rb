class CurrentUser
  attr_reader :partial, :id, :balls
  attr_accessor :user

  def initialize(user)
    @user = user || Guest.new
    @balls = []
  end

  def partial
    user.nil? || "layouts/main"
  end

  def image
    user.image
  end

  def team
    user.team
  end

  def team_ball
    user.team.count.times do |iteration|
      balls << "full_ball.png"
    end
    (6 - balls.count).times do |iteration|
      balls << "empty_ball.png"
    end
    balls
  end

  def poke_display
   if team.empty? || team.is_a?(OpenStruct)
     "home/new_poke_display"
   else
     "home/poke_display"
   end
  end

  def nav_bar
    if team.empty?
      "layouts/teamless_nav"
    else
      "layouts/nav"
    end
  end
end

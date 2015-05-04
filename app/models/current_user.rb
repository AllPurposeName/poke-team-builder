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
    user.team.id
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
end

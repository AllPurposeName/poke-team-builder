class CurrentUser
  attr_reader :partial, :id
  attr_accessor :user

  def initialize(user)
    @user = user || Guest.new
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
end

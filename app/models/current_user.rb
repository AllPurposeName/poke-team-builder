class CurrentUser
  attr_reader :user, :partial, :id

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

class CurrentUser
  attr_reader :user, :partial, :id

  def initialize(user)
    @user = user
  end

  def partial
    if user.nil?
      "layouts/welcome"
    else
      "layouts/main"
    end
  end

  def image
    if user.nil?
      "img"
    else
      user.image
    end
  end
end

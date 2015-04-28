class CurrentUser
  attr_reader :user, :partial

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
    user.image
  end
end

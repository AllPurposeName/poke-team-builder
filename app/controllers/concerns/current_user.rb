class CurrentUser
attr_reader :user
  def partial
    if user.nil?
      "layouts/welcome"
    else
      "layouts/main"
    end
  end
end

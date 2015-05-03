class Guest
  def initialize
  end

  def image
    "guest_image"
  end

  def nil?
    "layouts/welcome"
  end

  def team
    Openstruct.new({id: 9999999})
  end
end

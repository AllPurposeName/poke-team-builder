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
    OpenStruct.new({id: 9999999, count: 0})
  end
end

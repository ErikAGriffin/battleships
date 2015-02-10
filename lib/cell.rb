module Cell

  def y
    @y ||= 0
  end

  def x
    @x ||= 0
  end

  def coordinate
    [x, y]
  end

end
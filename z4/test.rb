class X
  def initialize
    @counter = 0
  end

  def m1(q)
    a = 5
    b = proc do |x|
      @counter += 1
      x * a
    end
    b.call(q)
  end
end

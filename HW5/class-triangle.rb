#Triangle class and tests

class Triangle
  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
    @type = ""
  end

  # Getters
  def a
    @a
  end

  def b
    @b
  end

  def c
    @c
  end

  def type
    @type
  end

  def perimeter
    @a + @b + @c
  end

  def area
    p = (@a + @b + @c) / 2.
    a = p - @a
    b = p - @b
    c = p - @c
    sqrt(p * a * b * c)
  end

  def test
    if @a + @b < @c || @a + @c < @b || @b + @c < @a
      @type = "false" ; return @type
    end

    if @a == @b && @a == @c
      @type = "equilateral"
    elsif @a ** 2 + @b ** 2 == @c ** 2
      @type = "right"
    end

    if @a == @b || @a == @c || @b == @c
      @isosceles = true
    else
      @scalene = true
    end

    if @type == "right" && @isosceles
      @type = "right isosceles"
    elsif @type == "right" && @scalene
      @type = "right scalene"
    end

    return @type
  end
end

tri = Triangle.new(1,2,3)
puts tri.test
if tri.test != "false"
  puts "perimeter: #{tri.perimeter}"
  puts "area: #{tri.area}"
end

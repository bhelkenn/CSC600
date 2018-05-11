#Triangle class and tests

class Triangle
  def initialize(a,b,c)
    @a = a ; @b = b ; @c = c
  end

  # Getters
  def a ; @a ; end
  def b ; @b ; end
  def c ; @c ; end

  def perimeter
    @a + @b + @c
  end

  def area
    @p = (@a + @b + @c) / 2.0
    Math.sqrt(@p * (@p - @a) * (@p - @b) * (@p - @c))
  end

  def right? ; @a ** 2 + @b ** 2 == @c ** 2 ; end
  def equilateral? ; @a == @b && @a == @c ; end
  def not_a_triangle?
    @a + @b <= @c || @a + @c <= @b || @b + @c <= @a
  end
  def isosceles? ; @a == @b || @a == @c || @b == @c ; end

  def test
    if self.not_a_triangle? then return "Not a valid Triangle"
    elsif self.equilateral? then return "equilateral"
    elsif self.isosceles? && self.right? then return "right isosceles"
    elsif self.isosceles? then return "isosceles"
    elsif self.right? then return "right scalene"
    else return "scalene" ; end
  end
end

a = 1.0 ; b = 2.0 ; c = 3.0
3.times do
  tri = Triangle.new(a,b,c) ; puts "Triangle(#{a},#{b},#{c}) created"
  if tri.test == "Not a valid Triangle"
    puts tri.test ; puts ; a += 1 ; b += 1 ; c += 1 ; next
  end

  puts "Triangle Type: #{tri.test}"
  puts "Perimeter: #{tri.perimeter}"
  puts "Area: #{tri.area}" ; puts
  a += 1 ; b += 1 ; c += 1
end

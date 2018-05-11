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
    @p = (@a + @b + @c) / 2.0
    Math.sqrt(@p * (@p - @a) * (@p - @b) * (@p - @c))
  end

  def test
    if @a + @b <= @c || @a + @c <= @b || @b + @c <= @a
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

    if @isosceles
      if @type == "right" then @type += " isosceles"
      else @type = "isosceles"
      end
    elsif @scalene
      if @type == "right" then @type += " scalene"
      else @type = "scalene"
      end
    end

    return @type
  end
end

input = ""
loop do
  print "Enter side A: "
  input = gets.chomp
  if input != "q" then a = input
  else break
  end
  print "Enter side B: "
  input = gets.chomp
  if input != "q" then b = input
  else break
  end
  print "Enter side C: "
  input = gets.chomp
  if input != "q" then c = input ; puts
  else break
  end

  tri = Triangle.new(a.to_f,b.to_f,c.to_f)
  puts "Triangle Type: #{tri.test}"
  if tri.test != "false"
    puts "Perimeter: #{tri.perimeter}"
    puts "Area: #{tri.area}" ; puts
  end
end

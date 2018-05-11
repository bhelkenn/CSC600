#Sphere class with Ball and MyBall subclasses

class Sphere
  def initialize(radius)
    @radius = radius
  end

  def radius ; @radius ; end
  def area ; 4 * Math::PI * (@radius ** 2) ; end
  def volume ; 4 / 3.0 * Math::PI * (@radius ** 3) ; end
  def show ; puts "Radius: #{self.radius}" ; end
  def show_size
    puts "Area: #{self.area}" ; puts "Volume: #{self.volume}"
  end
end

class Ball < Sphere
  def initialize(radius, color)
    @radius = radius ; @color = color
  end

  def color ; @color ; end
  def show
    puts "Radius: #{self.radius}"
    puts "Color: #{self.color}"
  end
end

class MyBall < Ball
  def initialize(radius, color, owner)
    @radius = radius ; @color = color ; @owner = owner
  end

  def owner ; @owner ; end
  def show
    puts "Radius: #{self.radius}"
    puts "Color: #{self.color}"
    puts "Owner: #{self.owner}"
  end
end

ball = Sphere.new(1.0) ; puts "New Sphere created"
ball.show ; ball.show_size ; puts

ball = Ball.new(2.0, "red") ; puts "New Ball created"
ball.show ; ball.show_size ; puts

ball = MyBall.new(4.0, "red", "Brady") ; puts "New MyBall created"
ball.show ; ball.show_size ; puts

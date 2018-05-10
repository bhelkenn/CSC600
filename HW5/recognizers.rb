#recognizer methods to extend Array class

class Array
  def limited? (amin, amax)
    self.each do |i|
      if i < amin || i > amax
        return false
      end
    end
    return true
  end

  def sorted?
    if self.sort == self
      return 1
    elsif self.sort.reverse == self
      return -1
    else
      return 0
    end
  end

end

a = [1, 3, 2, 5, 4]
b = a.sort
c = b.reverse

puts "a.limited?(0,6) #{a.limited?(0,6)}"
puts "b.limited?(3,6) #{b.limited?(3,6)}"

p a; p b; p c
puts "a.sorted? #{a.sorted?}"
puts "b.sorted? #{b.sorted?}"
puts "c.sorted? #{c.sorted?}"

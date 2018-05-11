#recognizer methods to extend Array class

class Array
  def limited? (amin, amax)
    self.each do |i|
      return false if i < amin || i > amax
    end
    return true
  end

  def sorted?
    if self.sort == self then return 1
    elsif self.sort.reverse == self then return -1
    else return 0 ; end
  end
end

a = [1, 3, 2, 5, 4]
b = a.sort
c = b.reverse

print "a = " ; p a
print "b = " ; p b
print "c = " ; p c

puts "a.limited?(0,6) #{a.limited?(0,6)}"
puts "b.limited?(3,6) #{b.limited?(3,6)}"
puts "a.sorted? #{a.sorted?}"
puts "b.sorted? #{b.sorted?}"
puts "c.sorted? #{c.sorted?}"

#loop demo program
n = 0
loop do
  if n < 3 then puts "looping"
  else break
  end
  n += 1
end

n = 0
puts "while:"
while n < 5 do
  print "#{n} "
  n += 1
end ; puts

n = 0
puts "until:"
until n == 10 do
  print "#{n} "
  n += 1
end ; puts

a = [1, 2, 3, 4, 5]
for i in a do
  puts i
end

3.upto(10) do |i|
  print "#{i} "
end ; puts

8.downto(1) do |i|
  print "#{i} "
end ; puts

5.times do
  puts "doing this 5 times"
end

print "each: "
a.each do |i|
  print "#{i} "
end ; puts

p a.map {|i| i ** 2}
p a

(0..10).step(2) {|i| print "#{i} "} ; puts

a = [1, 1, 2, 3, 2, 3, 4, 5]
print "collect * 2: " ; p a.collect {|i| i * 2}
print "select evens: " ; p a.select {|i| i % 2 == 0}
print "reject evens: " ; p a.reject {|i| i % 2 == 0}

#loop demo program
n = 0
loop do
  puts "basic looping" ; n += 1
  break if n >= 3
end

n = 0
print "while: "
while n < 5 do
  print "#{n} " ; n += 1
end ; puts

n = 0
print "until: "
until n == 10 do
  print "#{n} " ; n += 1
end ; puts

a = [1, 2, 3, 4, 5]
print "for: "
for i in a do
  print "#{i} "
end ; puts

print "upto: "
3.upto(10) do |i|
  print "#{i} "
end ; puts

print "downto: "
8.downto(1) do |i|
  print "#{i} "
end ; puts

5.times {puts "doing this 5 times"}

print "each: "
a.each do |i|
  print "#{i} "
end ; puts

puts "Mapping squares:"
p a.map {|i| i ** 2}
p a

print "stepping by 2: "
(0..10).step(2) {|i| print "#{i} "} ; puts

a = [1, 1, 2, 3, 2, 3, 4, 5]
print "collect * 2: " ; p a.collect {|i| i * 2}
print "select evens: " ; p a.select {|i| i % 2 == 0}
print "reject evens: " ; p a.reject {|i| i % 2 == 0}

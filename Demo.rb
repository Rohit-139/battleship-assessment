arr = File.readlines("Input.txt")
# puts arr 
# arr.each_with_index do |i,index| 
# 	puts "#{index} = #{i}" 
# end
grid = Array.new(5) { Array.new(5)  }

# puts grid 
ship_position = arr[2].split(":")
 # ship_position.each do |e| 
 # 	print "#{e}  ||"
 # end

   ship_position.each do |i| 
    cord = i.split(",")
   puts one = cord[0]
    two = cord[1]
    grid[one.to_i][two.to_i]="ship1"
    end
# ship_position2 = arr[2].split(":")
# ship_position2.each do |i|
# 	cord = i.split(",")
# 	puts one = cord[0]
# 	two = cord[1]
# 	grid[one.to_i][two.to_i]="ship2"
# end
#  puts grid


# ship_position.each do |e| 
# 	s << e.split(",")
# end

# 3.times do 
# 	grid.each do |row| 
# 		row.each do |col|
# 		   if	grid[0][1]=="ship1"
# 		   	grid[2][1]="X"
# 		   else
# 		   	grid[2][1]="B"
# 		   end
# 		end
# 	end
# end

require ("./Ships.rb")
ob=Ships.new
a=ob.ship_cordinates(arr[5])
puts a
	
	puts "code"
	a.each do |i| 
		dummy = i.split(",")
	   m=	dummy[0]
	   n = dummy[1]
	   if grid[m.to_i][n.to_i]=="ship1"
	   	grid[m.to_i][n.to_i]="X" 
	   else grid[m.to_i][n.to_i]="O"
	   end
	end
	
	print grid
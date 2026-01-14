require ("./exception.rb")

class Ship 
   #for ship coordinates
	def ship_cordinates(str)
		ship_cordinates = str.split(":")
	end
  
  def self.taking_input
  	input_arr = File.readlines("Input.txt")
  end

  def self.grid_array(n)
  	array = Array.new(n.to_i) {Array.new(n.to_i)}
  end

  def ship_place(str,grid_array)
  	str.each do |elements|
  		cords = elements.split(",")
  		i = cords[0]
  		j = cords[1]
  		grid_array[i.to_i][j.to_i] = "B"
  	end
  	return grid_array
 	end

 	def hit_missile(arr,missile)
 		missile.each do |m|
 			cords = m.split(",")
 			i = cords[0]
 			j= cords[1]

 	   if arr[i.to_i][j.to_i] == "B"
 			arr[i.to_i][j.to_i] = "X"
 		 else
 			arr[i.to_i][j.to_i] = "O"
 		 end
 	 end
 	end


 	def empty_arr(arr)
 		arr.map! do |row|
 			row.map!  {|col| col.nil? ? "-": col}
 			end
 	end  


 	def check_hit(arr)
 		count = 0
 		arr.map do |row|
 			row.map {|col| col=="X"? count +=1 : col}
 		end
 		return count 
 	end

 	def write_2d_array_to_file(filename, data)
  File.open(filename, "a") do |file|
    data.each do |row|
      file.puts row.join(" ")
    end
   end
  end


  def print_player(filename,n)
    File.open(filename,"a") do | file|
      file.puts("PLAYER #{n}")
    end
  end
  
  #return false if String contains any character
  def is_valid_integer?(o)
  true if Integer(o) rescue false
  end


  def check_valid?(arr)
    arr.each_with_index do |line,index|
    begin
    l=line.delete(',:')
    if !is_valid_integer?(l)
      raise InvalidInputType
    end
    
    rescue InvalidInputType => e
      puts e.message
      puts "invalid String in line #{index+1}"
      return true
    end
   end
   return false
  end

end
 

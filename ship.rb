require ("./exception.rb")

class Ship
 #for ship coordinates
  def ship_cordinates(str)
	  ship_cordinates = str.split(":")
	end
  
  def self.taking_input
    input_arr = File.readlines("input.txt")
  end

  def self.grid_array(n)
  	array = Array.new(n.to_i) {Array.new(n.to_i)}
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
     file.puts("\nPLAYER #{n}")
    end
  end
  
  def clear_output(filename)
    File.open(filename,"w") do |file|
     file.puts('Battleship Game Simulation')
    end
  end

end
 

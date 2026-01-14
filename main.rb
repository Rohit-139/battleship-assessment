require_relative ("./ship.rb")
require 'byebug'
require ("./exception.rb")
class Main 
	def grid_array(arr)
		grid_size = arr[0]
    grid_array = Ship.grid_array(grid_size)
    return grid_array 
   end
     

  def place_ship(arr,grid_array)
  	player = Ship.new 
    target_cords =  player.ship_cordinates(arr)
    player.ship_place(target_cords,grid_array)
  end

  def hit_missile(arr,grid_array)
  	player = Ship.new 
  	missile = player.ship_cordinates(arr)
  	player.hit_missile(grid_array,missile)
  	player.empty_arr(grid_array)
  	return grid_array
  end

  def print_output(filename , grid1,grid2)
  	player = Ship.new 
  	player.print_player(filename,1)
  	player.write_2d_array_to_file(filename,grid1)
    player.print_player(filename,2)
    player.write_2d_array_to_file(filename,grid2)
  end

  def result(filename,grid1,grid2)
  	player = Ship.new
  	hit1 = player.check_hit(grid1)
    hit2 = player.check_hit(grid2)
    if hit1> hit2 
	   File.open(filename,"a") do |file| 
	   file.puts("PLAYER 1 hit #{hit1} hits , Player 1 Won ") end
    elsif hit1 < hit2 
     File.open(filename,"a") do |file|
     file.puts("PLAYER 2 hit #{hit2} hits , Player 2 Won") end
    else 
     File.open(filename,"a") do |file|
     file.puts("PLAYER 1 and PLAYER 2 Both hit the Same number of hits : Match is Drawn") end
      end
   end

   def check_empty?(arr)
    begin
     if arr.empty? 
     raise EmptyArrException
     end 
    rescue EmptyArrException => e 
    puts e.message
    return true
    end
    return false
   end

   def check_length?(arr)
    begin
      if arr.size < 7
      raise LessInputException 
      end
    rescue LessInputException => e
     puts e.message
     return true
    end
     return false
   end
   
   def check_valid?(arr)
    object = Ship.new
    return object.check_valid?(arr)
   end

   def check_gridsize?(arr)
    gs = arr[0]
    begin
    if gs.to_i == 0
    raise GridSizeException
    elsif gs.to_i < 0
    raise GridSizeException
    elsif gs.to_i >= 10
    raise GridSizeException
    end
    rescue GridSizeException => e
    puts e.message
    return true
    end
    return false
   end 
end


#main program
arr = Ship.taking_input
ob = Main.new
if ob.check_empty?(arr)
  puts"Program Exited"
elsif ob.check_length?(arr)
  puts "program Exited"
elsif ob.check_valid?(arr)
  puts "program Exited"
elsif ob.check_gridsize?(arr)
  puts "Program Exited"
else 
  p1 = arr[2]
  p2 = arr[3]
  p1_m = arr[5] 
  p2_m = arr[6]
  gr1 = ob.grid_array(arr)
  gr2 = ob.grid_array(arr)
  ob.place_ship(p1,gr1)
  ob.place_ship(p2,gr2)
  ob.hit_missile(p1_m,gr1)
  ob.hit_missile(p2_m,gr2)
  ob.print_output("Output.txt",gr1,gr2)
  ob.result("Output.txt",gr1,gr2)
  puts "Program runs succesfully Check output in Output.txt file"
end


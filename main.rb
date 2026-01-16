require_relative ("./ship.rb")
require 'byebug'
require ("./validation.rb")

class Main 
  def grid_array(arr)
    grid_size = arr[0]
    grid_array = Ship.grid_array(grid_size)
    return grid_array 
  end

  def game_logic(arr, ship_cordinates, missile_cordinates)
    missile_cordinates.each do |missile|
      if ship_cordinates.include?(missile)
        missile_index = missile.split(',')
        arr[missile_index[0].to_i][missile_index[1].to_i] = 'X'
        ship_cordinates.delete(missile)
      else
        missile_index = missile.split(',')
        arr[missile_index[0].to_i][missile_index[1].to_i] = 'O'
      end
    end

    ship_cordinates.each do |ship|
      ship_index = ship.split(',')
      arr[ship_index[0].to_i][ship_index[1].to_i] = 'B'
    end
    empty_ship = Ship.new
    empty_ship.empty_arr(arr)
  end

  def print_output(filename, grid1, grid2)
    output = Ship.new 
    output.clear_output(filename)
    output.print_player(filename, 1)
    output.write_2d_array_to_file(filename, grid1)
    output.print_player(filename, 2)
    output.write_2d_array_to_file(filename, grid2)
  end

  def result(filename, grid1, grid2)
    player = Ship.new
    hit1 = player.check_hit(grid1)
    hit2 = player.check_hit(grid2)
    if hit1 > hit2
      File.open(filename,'a') do |file|
        file.puts("\nPLAYER 1 hit #{hit1} hits, Player 1 Won 
          \nPlayer 2 hits = #{hit2}") 
      end
    elsif hit1 < hit2 
      File.open(filename,'a') do |file|
        file.puts("\nPLAYER 2 hit #{hit2} hits, Player 2 Won \nprint_player 1 hits
          = #{hit1}")
      end
    else 
      File.open(filename,'a') do |file|
        file.puts("\nPLAYER 1 and PLAYER 2 Both hit the Same number of hits : Match is Drawn
          \nPlayer 1 hits = #{hit1} \nPlayer 2 hits = #{hit2}") 
      end
    end
  end
end

#main program
arr = Ship.taking_input
validation = Validation.new
if validation.check_all_validations(arr)
  puts 'Program Exited'
else
  ob = Main.new
  p1 = arr[2].chomp.split(':').to_set
  p2 = arr[3].chomp.split(':').to_set
  p1_m = arr[5].chomp.split(':').to_set 
  p2_m = arr[6].chomp.split(':').to_set
  gr1 = ob.grid_array(arr)
  gr2 = ob.grid_array(arr)
  ob.game_logic(gr1, p1, p1_m)
  ob.game_logic(gr2, p2, p2_m)
  ob.print_output('output.txt', gr1, gr2)
  ob.result('output.txt', gr1, gr2)
  puts 'Program runs succesfully Check output in Output.txt file'
end

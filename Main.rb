require_relative ("./ship.rb")

arr = Ship.taking_input
grid_size = arr[0]
grid_array1 = Ship.grid_array(grid_size)
grid_array2 = Ship.grid_array(grid_size)


#Ships for player 1 
player1 = Ship.new 
target_cords1 =  player1.ship_cordinates(arr[2])
missile1 = player1.ship_cordinates(arr[5])


#Ships for player 2 
player2 = Ship.new
target_cords2 = player2.ship_cordinates(arr[3])
missile2 = player2.ship_cordinates(arr[6])

player1.ship_place(target_cords1,grid_array1)
player2.ship_place(target_cords2,grid_array2)

player1.hit_missile(grid_array1,missile1)
player1.empty_arr(grid_array1)

# out = File.new("Output.txt","a")
# out.print(grid_array1)

player2.hit_missile(grid_array2,missile2)
player2.empty_arr(grid_array2)

hit1 = player1.check_hit(grid_array1)
hit2 = player2.check_hit(grid_array2)


if hit1> hit2 
	puts "Player 1  won"
elsif hit1 < hit2 
puts "player 2 Won" 
else puts "match is drawn"
end

player1.write_2d_array_to_file("Output.txt",grid_array1)
print grid_array1
class Validation
	# Note:-
	# cordinates = cords
	# grid_size = gs

  def check_all_validations(arr)  
    if check_empty?(arr) || check_length?(arr) || check_valid?(arr) || check_gridsize?(arr) || check_cordinate_valid?(arr) || check_ships_and_cordinates(arr) || check_missile_and_cordinates(arr)
      return true
    else 
      return false
    end
  end

  private

  def is_valid_integer?(o)
    true if Integer(o) rescue false
  end

  def check_valid?(arr)
    arr.each_with_index do |line,index|
      begin
        l = line.delete(',:')
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

  def check_gridsize?(arr)
    gs = arr[0].to_i
    begin
      if gs == 0 || gs < 0 || gs >= 10
        raise GridSizeException
      end
    rescue GridSizeException => e
      puts e.message
      return true
    end
    return false
  end 

  def check_ships_and_cordinates(arr)
    no_of_ships = arr[1].to_i
    no_of_cords_p1 = arr[2].delete(',:').to_i.digits.size
    no_of_cords_p2 = arr[3].delete(',:').to_i.digits.size
    begin
      if 2 * no_of_ships != no_of_cords_p1 || 2 * no_of_ships != no_of_cords_p2
        raise InvalidCordAndShip
      end
    rescue InvalidCordAndShip => e 
      puts e.message
      return true
    end
    return false
  end

  def check_missile_and_cordinates(arr)
    no_of_missiles = arr[4].to_i
    no_of_cords_p1 = arr[5].delete(',:').to_i.digits.size
    no_of_cords_p2 = arr[6].delete(',:').to_i.digits.size
    begin
      if 2 * no_of_missiles != no_of_cords_p1 || 2 * no_of_missiles != no_of_cords_p2
        raise InvalidCordAndMissile
      end
    rescue InvalidCordAndMissile => e 
      puts e.message
      return true
    end
    return false
  end

  def check_between?(size,arr)
    !arr.all? { |e| e < size && e >= 0 }
  end

  def check_cordinate_valid?(arr)
    size = arr[0].to_i
    coordinates_index = [2,3,5,6]
    coordinates_index.each do |coordinate|
      cord = arr[coordinate].split(/[:,]/).map(&:to_i)
        begin
          if check_between?(size,cord)
            raise InvalidCordinates , "The Cordinates should be between 0 and #{size-1}" 
          end
        rescue InvalidCordinates => e 
          puts e.message
          return true
        end
    end
    return false
  end

end

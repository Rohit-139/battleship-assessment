class EmptyArrException < StandardError
	def initialize(msg = "Empty Array Exception : please put valid array")
		super(msg)
	end
end

class LessInputException < StandardError 
	def initialize(msg = "Input row values should be atleast 7")
		super(msg)
	end
end

class InvalidInputType < StandardError 
	def initialize(msg = "The file contain String values , This is invalid")
		super(msg)
	end
end

class GridSizeException < StandardError
	def initialize(msg = "Please enter grid size between 1 to 9")
		super(msg)
	end
end
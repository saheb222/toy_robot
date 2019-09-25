class Robot
	XMAX = 5
	YMAX = 5
	attr_accessor :x,:y,:f
	def initialize(x_coord,y_coord,f)
		if is_a_valid_coordinate(x_coord,y_coord)
			@x = x_coord
			@y = y_coord
			@f = f 
		else
			raise ArgumentError,"not a right position to place the robot"
		end
	end
	def is_a_valid_coordinate(x,y)
		x<0 || x>XMAX-1 || y<0 || y>YMAX ? false : true 
	end
end
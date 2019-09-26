class Robot
	XMAX = 5
	YMAX = 5
	TURN_RIGHT = {NORTH: "EAST", SOUTH: "WEST", EAST: "SOUTH", WEST: "NORTH"}
  TURN_LEFT = {NORTH: "WEST", SOUTH: "EAST", EAST: "NORTH", WEST: "SOUTH"}
	attr_accessor :x,:y,:f
	def initialize(x_coord,y_coord,f)
		if !will_fall?(x_coord,y_coord,1)
			@x = x_coord
			@y = y_coord
			@f = f 
		else
			raise "not a right position to place the robot"
		end
	end

	def move
		if @f == "NORTH" && @y<YMAX-1
			@y += 1
		elsif @f == "SOUTH" && @y>0
			@y -= 1
		elsif @f == "EAST" && @x<XMAX-1	
			@x +=1	
		elsif @f == "WEST" && @x>0
			@x -= 1
		else
			raise
		end
	end
	
	def turn(direction)
		@f = direction == "RIGHT" ? TURN_RIGHT[@f.to_sym] : TURN_LEFT[@f.to_sym]
	end
	
	def report
		"#{@x},#{@y},#{@f}"
	end
	
	def will_fall?(x,y,boundary)
		x<0 || x>XMAX-boundary || y<0 || y>YMAX-boundary ? true : false 
	end
end
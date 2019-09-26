class Robot
	XMAX = 5
	YMAX = 5
	MOVEMENT = {NORTH:"@y += 1", SOUTH:"@y -= 1", EAST:"1", WEST:"-1"}
	attr_accessor :x,:y,:f
	def initialize(x_coord,y_coord,f)
		if !will_fall?(x_coord,y_coord,1)
			@x = x_coord
			@y = y_coord
			@f = f 
		else
			raise ArgumentError,"not a right position to place the robot"
		end
	end
	
	def move
		if !will_fall?(@x,@y,2)
			if @f == "NORTH" 
				@y += 1
			elsif @f == "SOUTH"
				@y -= 1
			elsif @f == "EAST"	
				@x +=1	
			else @f == "WEST"
				@x -= 1
			end
		else
			raise "prevented from falling out from table"
		end
	end
	
	def turn(direction)
		puts "turning : #{direction}"
	end
	
	def report
		puts "reporting the status"
	end
	
	def will_fall?(x,y,boundary)
		x<0 || x>XMAX-boundary || y<0 || y>YMAX-boundary ? true : false 
	end
end
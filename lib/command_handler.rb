require_relative "lib/robot" 
class CommandHandler
	
	def start
		puts "please provide some command to play with me "
		input = gets.chomp
		while input != "q"
			start_command(input.upcase)
			puts "waiting for another command"
			input =  gets.chomp
		end	
		puts "bye...see you soon"	
	end

	def start_command(input)
		case input
		
		when /PLACE/
			result = "please provide place command  in correct format"
			place_command = input.split(" ")[1]&.split(",")
			if place_command.length == 3
				x = place_command[0].to_i
				y = place_command[1].to_i
				f = place_command[2]
				if is_validate_place_command?(x,y,f)
					@robot = Robot.new(x,y,f)
					if @robot?
						puts "robot placed"
						puts @robot.x
						puts @robot.y
					end 
				end
			end
		when "LEFT","RIGHT"
			puts "truning left/right"
		when "MOVE"
			puts "moving robot"
		when "report"
			puts "displaying the current status"
		else
			puts "not a valid command"
		end
	end

	def is_validate_place_command?(x,y,f)
		x.class==Fixnum && y.class==Fixnum &&["NORTH","SOUTH","EAST","WEST"].include?(f) ? true : false
	end
end
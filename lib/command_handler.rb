require_relative "robot" 
class CommandHandler
	attr_accessor :robot
	def start
		puts "please provide the PLACE command"
		input = gets.chomp
		while input != "q"
			start_command(input.upcase)
			input =  gets.chomp
		end	
		puts "Exiting..."	
	end

	def start_command(input)
		match_place=/^PLACE\s+\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/
		case input
		
		when match_place
			message = "please provide place command  in correct format"
			place_command = input.split(" ")[1]&.split(",")
			if place_command.length == 3
				x = place_command[0].to_i
				y = place_command[1].to_i
				f = place_command[2]
				if is_validate_place_command?(x,y,f)
					@robot = Robot.new(x,y,f) rescue nil
					if @robot
						message =  "robot successfuly placed, you can now perfrom other operations"
					else
						message = "not a right position to place the robot, please provide correct x,y"
					end
				end
				puts message
			end
		when "MOVE"
			puts @robot.move if operation_possible?
		when "RIGHT","LEFT"
			@robot.turn(input) if operation_possible?
		when "REPORT"
			puts @robot.report if operation_possible?
		else
			puts "invalid command"
		end
	end
	def operation_possible?
		puts "operation not possible" unless @robot
		@robot? true : false
	end
	def is_validate_place_command?(x,y,f)
		x.class==Integer && y.class==Integer &&["NORTH","SOUTH","EAST","WEST"].include?(f) ? true : false
	end
end
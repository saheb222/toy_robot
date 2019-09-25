require 'rspec'
require_relative "../lib/command_handler"
describe CommandHandler do
	describe "#is_validate_place_command?" do 
		it 'return false' do
			command = CommandHandler.new
			expect(command.is_validate_place_command?('a','b',"NORTH")).to eql(false)
		end
		it 'return true' do
			command = CommandHandler.new
			expect(command.is_validate_place_command?(1,1,"NORTH")).to eql(true)
		end
	end
	describe "#start_command" do 
		
	end
end
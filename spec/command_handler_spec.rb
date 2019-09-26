require 'rspec'
require_relative "../lib/command_handler"
RSpec.describe CommandHandler do
	# subject{CommandHandler.new}
	describe "#is_validate_place_command?" do 
		it 'returns false if the place command is not valid' do
			expect(subject.is_validate_place_command?('a','b',"NORTH")).to eql(false)
		end
		it 'return true if the place command is valid' do
			command = CommandHandler.new
			expect(subject.is_validate_place_command?(1,1,"NORTH")).to eql(true)
		end
	end
	context "ignore invalide move before place command" do 
		it "checks where any operation is permitable or  not" do
			expect(CommandHandler.new().operation_possible?).to eq(false)
		end
		it "ensures that other command can only be executed after a valif place command" do
			command = CommandHandler.new
			command.start_command("PLACE 1,1,SOUTH")
			expect(command.operation_possible?).to eq(true)
		end
	end
end
require_relative "../lib/robot"
RSpec.describe Robot do
	
	let(:robot) {Robot.new(1,2,"EAST")}

	it "initialize the robot"	do
		expect { robot }.not_to raise_error
	end
	
	context "fall out from table prevent" do
		it "stop from falling out from table" do 
			expect(Robot.new(4,4,"NORTH").move).to eq("it will result a fall down from table,hence not permitted")
		end
	end
	
	context "test case 3" do
		it "will run some test" do
			robot.move
			robot.move
			robot.turn "LEFT"
			robot.move
			expect(robot.report).to eq("3,3,NORTH")
		end
	end
end
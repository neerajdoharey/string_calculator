require 'rspec'
require_relative 'calculator'

describe Calculator do
	before(:each) do
    @cal = Calculator.new
  end
	
	describe '#add' do
		it 'return 0 if the value is blank' do
			expect(@cal.add("")).to eql(0)
		end

		it 'return sum if the value is positive' do
			expect(@cal.add("2")).to eql(2.0)
		end

		it 'return sum if the value is mulipule positive' do
			expect(@cal.add("1,2")).to eql(3.0)
		end

		it 'return sum if the delimeter is \n' do
			expect(@cal.add("1\n2,3")).to eql(6.0)
		end

		it 'return sum if the delimeter is \n' do
			expect(@cal.add("1\n2,3")).to eql(6.0)
		end

		it 'return error if the delimeter is not same' do
			expect(@cal.add("//;\n1,2")).to eql("Invalid delimeter")
		end

		it 'return error if the number is missing after \n' do
			expect(@cal.add("1,\n")).to eql("Invalid string")
		end

		it 'return error message if the value is negative' do
			expect(@cal.add("-1")).to eql("negatives not allowed")
		end

		it 'return error message with negative values if the value are mulipule' do
			expect(@cal.add("-1,2,-3")).to eql("negatives not allowed -1.0,-3.0")
		end

	end
end
class Calculator
	def add(str)
		@str = str
		@is_delimeter = str.include?('//')
		if @is_delimeter
			delimeter = str[2]
			arr = str.split("\n")
			@str = arr[1]
			validate(delimeter)
		else
			@is_newline = @str.include?("\n")
			@str = @is_newline ? @str.gsub("\n", ",") : @str
			validate(",")
		end
	end

	def validate(delimeter)
		is_wrong_delimeter = @is_delimeter ? @str.include?(delimeter) : false
		num_arr = @str.split(delimeter).map{|i| i == "" ? "" : i.to_f }
		negative_num = num_arr.select{|i| i < 0} unless num_arr.include?("")
		
		if @is_delimeter && !is_wrong_delimeter
			"Invalid delimeter"
		elsif @str == ""
			return 0
		elsif @is_newline && num_arr.size == 1
			"Invalid string"
		elsif @is_newline && num_arr.include?("")
			"Invalid string"
		elsif negative_num.size == 1
			"negatives not allowed"
		elsif negative_num.size > 1
			"negatives not allowed #{negative_num.join(",")}"
		else
			num_arr.sum
		end
	end
end

sum = Calculator.new
puts sum.add("")
puts sum.add("2")
puts sum.add("1,2")
puts sum.add("1\n2,3")
puts sum.add("1,\n")
puts sum.add("1,\n,2")
puts sum.add("1,\n\n2")
puts sum.add("//;\n1;2")
puts sum.add("//;\n1;;2")
puts sum.add("//;\n1,2")
puts sum.add("-1")
puts sum.add("-1,2,-3")

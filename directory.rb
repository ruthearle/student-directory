student_count = 23
# Lets put all students into array
students = []

def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# create an empty array
	students = []
	# get the full name
	puts "Students full name?"
	name = gets.chomp
	# while the name is not empty, repeat this code
	until name.empty? do
		#add the student hash to the array
		students << {:name => name.capitalize, :cohort => :august.capitalize}
		puts "Now we have #{students.length} students"
		# get another name from the user
		puts "Students full name?"
		name = gets.chomp
	end
	# return the array of students
	students
end


def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------"
end

def print(students)
	# each_with_index = exercise 2
	students.each_with_index do |student, index|
		# if statement = exercise 3
		#if student[:name].start_with?("A")
		#if statement = exercise 4
		if student[:name].length < 12
			puts "#{index} #{student[:name]} (#{student[:cohort]} cohort)"
		end
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end

#nothing happens until we call the methods

students = input_students
print_header
print(students)
print_footer(students)

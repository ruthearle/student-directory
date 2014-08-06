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

# Version 6
#def print(students)
#	students.each do |student|
#		puts "#{student[:name]} (#{student[:cohort]} cohort)"
#	end
#end

# Exercise 2
#def print(students)
#	students.each_with_index do |student, index|
#		puts "#{index} #{student[:name]} (#{student[:cohort]} cohort)"
#	end
#end

# Exercise 3
#def print(students)
#	students.each do |student|
#		if student[:name].start_with?("A")
#		puts "#{student[:name]} (#{student[:cohort]} cohort)"
#		end
#	end
#end

# Exercise 4
#def print(students)
#	students.each do |student|
#		if student[:name].length < 12
#		puts "#{student[:name]} (#{student[:cohort]} cohort)"
#		end
#	end
#end

# Exercise 5
def print(students)
	counter = 0
	while counter < students.size
		puts "#{students[counter][:name]} (#{students[counter][:cohort]} cohort)"
		counter += 1
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

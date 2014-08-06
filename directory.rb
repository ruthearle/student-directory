student_count = 23
# Lets put all students into array
students = []

def input_students
	puts "Please enter the names of the students and then enter the month the cohort started"	
	puts "To finish, type 'quit'"
	# create an empty array
	students = []
	# get the full name
	puts "Students full name?"
	name = gets.chomp
	# while the name is not equal to 'quit', repeat this code
	until name == "quit" do
		# get cohort
		puts "Cohort month?"
		cohort = gets.chomp.to_sym
		months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
			if cohort.empty? or !months.include? cohort.to_sym
				puts "Please enter the cohort month? or type 'yes' for August cohort"
				cohort = gets.chomp.to_sym
					if cohort == :yes
						cohort = :august
					end	
			end
		#add the student hash to the array
		students << {
									:name => name.upcase,
									:cohort => cohort.capitalize
								}
		puts "Now we have #{students.length} students"
		# get another name from the user
		puts "Students full name or 'quit'?"
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
def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end



def print_footer(students)
	puts "Overall, we have #{students.length} great students".center(80, "***")
end

#nothing happens until we call the methods

students = input_students
print_header
print(students)
print_footer(students)

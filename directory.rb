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
	name = gets.chop
	# while the name is not equal to 'quit', repeat this code
	until name == "quit" do
		# get cohort
		puts "Cohort month?"
		cohort = gets.chop.to_sym
		month = [
								:january, 
								:february, 
								:march, 
								:april, 
								:may, 
								:june, 
								:july, 
								:august, 
								:september, 
								:october, 
								:november, 
								:december
							]
		until month.include? cohort.to_sym
			if cohort.empty? or !month.include? cohort.to_sym
				puts "You typed '#{cohort}'. Please enter the cohort month? or type 'yes' for August cohort"
				cohort = gets.chop
					if cohort == "yes"
						cohort = :august
					end	
					if 
						puts "You typed #{cohort}. Please retype the cohort month"
						cohort = gets.chop
					end
			end
		end
		#add the student hash to the array
		students << {
									:name => name.upcase,
									:cohort => cohort.to_sym.capitalize
								}
		# Exercise 10
		if students.length == 1
			puts "Now we have #{students.length} student"
		else
			puts "Now we have #{students.length} students"
		end
		# get another name from the user
		puts "Students full name or 'quit'?"
		name = gets.chop
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

# Exercise 9: printing grouped by cohort
def print_cohort(students)
	students.sort_by! { |hash| hash[:cohort] }
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(students)
	if students.length == 1
		puts "Overall, we have #{students.length} great student".center(80, "***")
	else
		puts "Overall, we have #{students.length} great students".center(80, "***")
	end
end

#nothing happens until we call the methods

students = input_students
print_header
#print(students)
print_cohort(students)
print_footer(students)

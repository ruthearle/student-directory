@students = [] # an empty array accessible to all methods

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------"
end

# Version 6
def print_student_list
	@students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer
	if @students.length == 1
		puts "Overall, we have #{@students.length} great student".center(80, "***")
	else
		puts "Overall, we have #{@students.length} great students".center(80, "***")
	end
end

def input_students
	puts "Please enter the names of the students and then enter the month the cohort started"	
	puts "To finish, type 'quit'"
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
		@students << {
									:name => name.upcase,
									:cohort => cohort.to_sym.capitalize
								}
		# Exercise 10
		if @students.length == 1
			puts "Now we have #{@students.length} student"
		else
			puts "Now we have #{@students.length} students"
		end
		# get another name from the user
		puts "Students full name or 'quit'?"
		name = gets.chop
	end
	# return the array of students
	@students
end

def print_menu
	# 1. print the menu and ask the user what to do
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save students"
	puts "9. Exit"
end

def show_students
	print_header
	print_student_list
	#print_cohort(@students)
	print_footer
end

def process(selection)
	case selection
		when "1"
			input_students
		when "2"
			show_students
		when "3"
			save_students
		when "9"
			exit # this will cause the program to terminate
		else
			puts "I don't know what you meant, try again"
	end
end


def interactive_menu
	loop do
		print_menu
		process(gets.chomp)
	end
end

def save_students
	# open the file for writing
	file = File.open("student.csv", "w")
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end

# just checking if students file will be uploaded
#nothing happens until we call the methods
interactive_menu

@students = [] # an empty array accessible to all methods
@name = "" # empty variable accessible to all methods
@cohort = " " # empty vairble accessible to all methods

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

def month
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
end

def default_month
  if @cohort == "yes".downcase
    @cohort = Time.now.strftime("%B").downcase.to_sym
  end
  @cohort
end

def student_name
  puts "Students full name?"
  @name = STDIN.gets.chomp
end

# enter current month if so wish
def cohort_month
  @cohort = STDIN.gets.chomp
  default_month
end

# check spelling
def test_cohort_spelling
  until month.include? @cohort.to_sym
    puts "You typed '#{@cohort}'"
    puts "Please enter the cohort month? or type 'yes' for this month"
    cohort_month
  end
end

def input_students
  puts "Please enter the names of the students and then enter the month the cohort started"	
  puts "Press 'enter' twice to quit."
  # get the full name
  student_name
  # while the name is not equal to 'quit', repeat this code
  until @name.empty? do
    # get cohort
    puts "Cohort month? or type 'yes' for August"
    cohort_month
    # check spelling of cohort month and offer a default value
    test_cohort_spelling
		#add the student hash to the array
		add_student(@name, @cohort)
		# Exercise 10
		if @students.length == 1
			puts "Now we have #{@students.length} student"
		else
			puts "Now we have #{@students.length} students"
		end
		# get another name from the user
    student_name
  end
	# return the array of students
	@students
end

def print_menu
	# 1. print the menu and ask the user what to do
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save students"
	puts "4. Load students"
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
		when "4"
			load_students
		when "9"
			exit # this will cause the program to terminate
		else
			puts "I don't know what you meant, try again"
	end
end


def interactive_menu
	loop do
    process(gets.chomp!)
		print_menu
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

def add_student(name, cohort)
	@students << { :name => @name.upcase, :cohort => @cohort.to_sym.capitalize }
end

def load_students(filename = "student.csv")
	file = File.open(filename, "r")
	file.readlines.each do |line|
		@name, @cohort = line.chomp.split(',')
		add_student(@name, @cohort)
	end
	file.close
end

def try_load_students
	filename = ARGV.first # first argument from the command line
	return if filename.nil? # get out of the method if it isn't given
	if File.exists?(filname) # if it exits
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else # if it doesn't exist
		puts "Sorry, #{filename} doesn't exist."
		exit # quit program
	end
end


#nothing happens until we call the methods
try_load_students
interactive_menu

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  if students.length > 1
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  if names.length > 1
    puts "Overall, we have #{names.length} great students"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  until name.empty? do
    # add the student hash to the array
    students << {
                  :name => name, 
                  :cohort => :november
                }    
    puts "Now we have #{students.length} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

students = input_students
print_header
print(students)
print_footer(students)
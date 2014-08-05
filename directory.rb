student_count = 23
# Lets put all students into array
students = [
	"Ruth Earle",
	"Andy Gates",
	"Marc Singh",
	"Faisal Aydarus",
	"Ethel Ng",
	"Kevin Daniels",
	"Maya Driver",
	"Leopold Kwok",
	"James McNeil",
	"Jerome Pratt",
	"David Wickes",
	"Javier Silverio",
	"Elliot Lewis",
	"Ben Tillett",
	"Vincent Koch",
	"Michelle Ballard",
	"Nick Roberts",
	"Tatiana Soukiassian",
	"Merve Silk",
	"Albert Vallverdu",
	"Loius Schultze",
	"Chris Oatley",
	"Spike Lindsey",
	"Henry Stanley"
]
# and then print them
puts "The students of my cohort at Makers Academy"
puts "-------------"
students.each do |student|
	puts student
end

#finally, we print the total
puts "Overall, we have #{students.length} great students"

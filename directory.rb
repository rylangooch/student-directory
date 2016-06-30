def input_students
    puts "Please enter the name of the first student"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        puts "Please enter the student's cohort"
        cohort = gets.chomp
        if cohort.empty? 
            cohort = "undisclosed"
        end
        puts "Please enter the student's hobbies"
        hobbies = gets.delete("\n") # an alternative to .chomp
        puts "Please enter the student's country of birth"
        cob = gets.chomp
        puts "Please enter the students height in cm"
        height = gets.chomp
        # add the student hash to the array
        students << {name: name, cohort: cohort.intern, hobbies: hobbies, cob: cob, height: height}
        puts "Now we have #{students.count} #{students.count == 1? "student" : "students"}. Please enter the name of the next student or press return to quit"
        # get another name from the user
        name = gets.chomp
    end 
    # return the array of students
    students
end
        
def print_header
    puts "The students of Villains Academy"
    puts "___________"
end

def print_s(students)
    counter = 0
    while counter < students.length
        puts "#{students[counter][:name]} (#{students[counter][:cohort]} cohort)"
        puts "Hobbies: #{students[counter][:hobbies]}"
        puts "Country of birth: #{students[counter][:cob]}"
        puts "Height: #{students[counter][:height]}"
        counter += 1
    end
end

def print_by_cohort(students)
    cohort_month = []
    puts "Enter the cohort you wish to view or press return to exit"
    month = gets.chomp
    students.map do |student|
        if student[:cohort] == month.to_sym
            cohort_month << student
        end
    end
    print_s(cohort_month)
end


def print_footer(students)
    puts "Overall, we have #{students.count} great #{students.count == 1? "student" : "students"}"
end

students = input_students
print_header
print_s(students)
print_footer(students)
print_by_cohort(students)
puts "Hello"
def say_hello
  puts "Hello"
end

say_hello

teachers = ["JJ", "Sophie", "Ian"]

def say_teachers_names(teachers)
  teachers.each do |teacher|
    puts teacher
  end
end

say_teachers_names(teachers)

teacher = {:name => "Ian", :hometown => "Pittsburgh"}
puts teacher[:hometown]

"{name: 'Ian', hometown: 'Pittsburgh'}"

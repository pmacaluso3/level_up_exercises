def view_home
  puts @messages if @messages
  @messages = ""
  puts "Hello there Dinosaur Hunter! What would you like to do today??"
  puts "--- Type 'view' to see your Dinosaurs."
  puts "--- Type 'add' to add a Dinosaur."
  puts "--- Type 'search' to pull up Dinosaur Search Functions."
  puts "--- Type 'save' to save your Dinosaurs."
  puts "--- Type 'exit' to exit the program."
  input = gets.downcase.chomp
  if input == 'save' || input == 'add' || input == 'search' || input == 'view'
    controller_home(input)
  elsif input == 'exit'
    puts "Catch Ya Later, Dinosaur Hunter!!"
    exit
  else
    puts "Sorry! That's not a valid option!"
    view_home
  end
end

def view_add_dino
  puts @messages if @messages
  @messages = ""
  dino = {}
  puts "What is the name of your Dinosaur"
  dino[:name] = gets.chomp
  puts "What prehistoric era did your Dinosaur live?"
  dino[:period] = gets.chomp
  puts "Upon what continent(s) did your Dinosaur live?"
  dino[:continent] = gets.chomp
  puts "What kind of diet did your Dinosaur have?"
  dino[:diet] = gets.chomp
  puts "How heavy was this Dinosaur (in lbs)?"
  dino[:weight_in_lbs] = gets.chomp
  puts "Was your Dinosaur a (Biped) or a (Quadruped)?"
  dino[:walking] = gets.chomp.capitalize!
  puts "Write up a little Description if you'd like..."
  dino[:description] = gets.chomp
  puts "Here's your Dinosaur:"
  dino.each{ |k, v| puts "#{k}: #{v}" }
  puts "Would you like to store it in your DinoDex? (Y/n)"
  response = gets.downcase.chomp
  controller_add_dino(dino, response)
end

def view_save_files
  puts "Where would you like to save your file?"
  puts "Remember to save it as a CSV file!"
  location = gets.chomp
  controller_save_file(location)
end

def view_search_dinos
  puts @messages if @messages
  @messages = ""
  puts "How would you like to search for your Dinosaurs?"
  puts "--- Type 'carnivores' if you'd like to see all the Carnivore Dinosaurs"
  puts "--- Type 'bipedal' to find bipedal Dinosaurs"
  puts "--- Type 'periods' search by Period."
  puts "--- Type 'size' to search by Size."
  puts "--- Type 'home' return Home."
  input = gets.downcase.chomp
  controller_search_dinos(input)
end

def view_show_dinos(dinosaurs)
  dinosaurs.each{ |dino| puts dino.to_s }
  view_home
end

def view_period_picker(periods)
  puts @messages if @messages
  @messages = ""
  periods.each_with_index { |o, i| puts "#{i}: #{o}" }
  puts "Which Period would you like to find Dinosaurs for? (select number)"
  input = gets.chomp.to_i
  choice = periods[input]
  controller_dino_by_period(choice)
end

def view_size_picker(sizes)
  sizes.each_with_index { |o, i| puts "#{i}: #{o}" }
  puts
  puts "Which size (select number)"
  input = gets.chomp.to_i
  choice = sizes[input]

  controller_dino_by_size(choice)
end

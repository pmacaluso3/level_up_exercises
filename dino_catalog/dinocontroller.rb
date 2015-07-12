def controller_home(input)
  case input
  when "view"
    view_show_dinos(@dinodex.dinosaurs)
  when "save"
    view_save_files
  when "add"
    view_add_dino
  when "search"
    view_search_dinos
  when "exit"
    exit
  else
    puts "That's not a valid option!"
    view_home
  end
end

def controller_add_dino(dino, response)
  if response == "y" || response == "yes"
    @dinodex.add(dino)
    puts "Dinosaur Added!"
    view_home
  else
    puts "Dinosaur has not been added..."
    view_home
  end
end

def controller_save_file(location)
  if @dinodex.dinosaurs.empty?
    puts "You have no data to save!"
    view_home
  else
    @dinodex.save(location)
    puts "Save Successful"
    view_home
  end
end

def controller_search_dinos(input)
  case input
  when "carnivores"
    view_show_dinos(@dinodex.find_carnivores)
  when "bipedal"
    view_show_dinos(@dinodex.find_bipeds)
  when "periods"
    available_periods = []
    @dinodex.dinosaurs.each{ |dino| available_periods << dino.period }
    avaialble_periods = available_periods.uniq!
    view_period_picker(available_periods)
  when "size"
    sizes = ['big', 'small']
    view_size_picker(sizes)
  when "home"
    view_home
  else
    puts "That's not a valid option!"
    view_search_dinos
  end
end

def controller_dino_by_period(period)
  dinos = @dinodex.find_by_period(period)
  view_show_dinos(dinos)
end

def controller_dino_by_size(size)
  dinos = @dinodex.find_by_size!(size)
  view_show_dinos(dinos)
end

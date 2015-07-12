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
    begin
      raise "That's not a valid option!"
    rescue
    end
    view_home
  end
end

def controller_add_dino(dino, response)
  if response == "y" || response == "yes"
    @dinodex.add(dino)
    @messages = "Dinosaur Added!"
    view_home
  else
    @messages = "Dinosaur has not been added..."
    view_home
  end
end

def controller_save_file(location)
  if @dinodex.dinosaurs.empty?
    begin
      raise "You have no data to save!"
    rescue
    end
    view_home
  else
    @dinodex.save(location)
    @messages = "Save Successful"
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
      sizes = ["small", "big"]
      view_size_picker(sizes)
    when "home"
      view_home
  else
    begin
      raise "That's not a valid option!"
    rescue
    end
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

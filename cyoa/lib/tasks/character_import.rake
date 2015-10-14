desc "make characters out of the marvel database"
namespace :import do
  task characters: :environment do
    offset_counter = 1
    misses = 0
    loop do
      response = CharacterFetcher.new(offset_counter*20).make_request
      character_array = CharacterParser.new(response).make_characters
      puts "Imported #{offset_counter * 20} characters slips..." if offset_counter % 5 == 0
      if character_array
        misses = 0
        Character.transaction { character_array.each(&:save!) }
      else
        misses += 1
        break if misses >= 5
      end
      offset_counter += 1
    end
  end
end
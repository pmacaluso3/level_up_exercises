desc "imports all the pieces of advice from the advice API and makes them into quotes"
namespace :import do
  task advice: :environment do
    counter = 1
    misses = 0
    loop do
      response = AdviceFetcher.new(counter).make_request
      quote = AdviceParser.new(response).make_quote
      puts "Imported #{counter} advice slips..." if counter % 10 == 0
      if quote
        misses = 0
        quote.save!
      else
        misses += 1
        break if misses >= 5
      end
      counter += 1
    end
  end
end

desc "imports all the pieces of advice from the advice API and makes them into questions"
namespace :import do
  task advice: :environment do
    counter = 1
    misses = 0
    loop do
      response = AdviceFetcher.new(counter).make_request
      question = AdviceParser.new(response).make_question
      puts "Imported #{counter} advice slips..." if counter % 10 == 0
      if question
        misses = 0
        question.save!
      else
        misses += 1
        break if misses >= 5
      end
      counter += 1
    end
  end
end

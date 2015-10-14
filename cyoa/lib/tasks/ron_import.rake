desc "import all the ron questions from the csv"
namespace :import do
  task ron: :environment do
    RonParser.new.make_all_questions!
  end
end

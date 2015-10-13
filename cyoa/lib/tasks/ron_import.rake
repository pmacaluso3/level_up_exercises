desc "import all the ron quotes from the csv"
namespace :import do
  task ron: :environment do
    RonParser.new.make_all_quotes!
  end
end

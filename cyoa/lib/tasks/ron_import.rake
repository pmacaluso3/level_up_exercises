desc "import all the ron quotes from the csv"
task ron_import: :environment do
  RonParser.new.make_all_quotes!
end
require 'csv'

class	RonParser
	attr_reader :filename
	attr_accessor :csv_data

	def initialize
		@filename = "#{Rails.root}/public/ron_quotes.csv"
		@csv_data = []
		populate_csv_data
	end

	def populate_csv_data
		CSV.foreach(filename) do |line|
			csv_data << line[0]
		end
	end

	def make_quote(string)
		Quote.new(content: string, ron_said_it: true)
	end

	def make_all_quotes!
		csv_data.each do |string|
			make_quote(string).save
		end
	end

end
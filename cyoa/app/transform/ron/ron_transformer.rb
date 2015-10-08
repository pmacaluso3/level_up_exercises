require 'csv'

class RonTransformer
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
end
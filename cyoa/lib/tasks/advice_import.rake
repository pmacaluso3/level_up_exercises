desc "imports all the pieces of advice from the advice API and makes them into quotes"
task advice_import: :environment do
	counter = 1
	loop do
		response = AdviceFetcher.new(counter).make_request
		quote = AdviceParser.new(response).make_quote
		if quote
			quote.save
		elsif !([22, 48, 67].include?(counter))
			break				
		end
		counter += 1	
	end
end
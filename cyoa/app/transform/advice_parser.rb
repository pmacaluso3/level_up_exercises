require 'json'

# class AdviceParser

# 	attr_reader :response_hash

# 	def initialize(response)
# 		@response_hash = JSON.parse(response)
# 	end

# 	def has_error?
# 		return true unless response_hash.has_key?("slip")
# 		!(response_hash["slip"].has_key?("advice"))
# 	end

# 	def new_quote
# 		if has_error?
# 		 	return false
# 		else
# 			Quote.new(content: response_hash["slip"]["advice"], ron_said_it: false)	
# 		end
# 	end
# end

class AdviceParser
	attr_reader :response

	def initialize(response)
		@response = JSON.parse(response)
	end

	def content
		if response["slip"]
			response["slip"]["advice"]
		else
			"error"
		end
	end

	def make_quote
		if content == "error"
			false
		else
			Quote.new(content: content, ron_said_it: false)
		end
	end

end
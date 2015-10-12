require 'httparty'

class AdviceFetcher
  ADVICE_URL_BASE = "http://api.adviceslip.com/advice"

  attr_reader :slip_id

  def initialize(slip_id = nil)
    @slip_id = slip_id
  end

  def url_extension
    slip_id.nil? ? "" : "/#{slip_id}"
  end

  def make_request
    HTTParty.get(ADVICE_URL_BASE + url_extension).parsed_response
  end
end

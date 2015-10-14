require 'httparty'
require 'marvelite'

class CharacterFetcher
  attr_accessor :client
  attr_reader :offset

  def initialize(offset)
    @offset = offset
    @client = Marvelite::API::Client.new(public_key: Cyoa.config.marvel_public_key, private_key: Cyoa.config.marvel_private_key)
  end

  def make_request
    client.characters(offset: offset)
  end
end

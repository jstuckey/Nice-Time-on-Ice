require 'open-uri'

# Wraps Nokogiri for parsing the NHL.com website
# Attempting to isolate this dependency
class NhlParser
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def call
    Nokogiri::HTML(URI.open(url), nil, "UTF-8")
  end
end

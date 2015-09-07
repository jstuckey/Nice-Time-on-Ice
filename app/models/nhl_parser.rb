require 'open-uri'

class NhlParser

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def call
    Nokogiri::HTML(open(url))
  end

end

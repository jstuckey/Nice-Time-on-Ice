require 'open-uri'

class NhlParser

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def call
    Nokogiri::HTML(open(url)) do |config|
      config.options = Nokogiri::XML::ParseOptions::NONET
    end
  end

end

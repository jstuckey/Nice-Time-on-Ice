configure :production do
  require 'newrelic_rpm'
end

configure do
  
  # Constants
  CURRENTSEASON = "20122013"
  
  # HTML Classes
  SEASONLINKCLASS = "season" 
  TEAMLINKCLASS = "team"
  GAMELINKCLASS = "game"
  SITELINKCLASS = "link"
  
  class Link
    attr_accessor :site
    attr_accessor :description
    attr_accessor :link
    
    def initialize(site, description, link)
      @site = site
      @description = description
      @link = link
    end
  end
  
  class APIResource
    attr_accessor :path
    attr_accessor :queryString
    attr_accessor :description
    attr_accessor :inputs
    attr_accessor :inputDescriptions
    attr_accessor :queryStringStartIndex
    
    def initialize(path, queryString, description, inputs, inputDescriptions)
      @path = path
      @queryString = queryString
      @description = description
      @inputs = inputs
      @inputDescriptions = inputDescriptions
      @queryStringStartIndex = path.count '{'
    end
  end
  
end

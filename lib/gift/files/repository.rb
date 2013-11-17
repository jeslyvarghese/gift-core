require_relative 'lib.rb'

class Repository
  attr_accessor :name, :url, :commits
  
  def initialize(url)
  	@url = url
  end

  def clone_to(location)
    Git::Lib.new.clone @url, location 
  end
end

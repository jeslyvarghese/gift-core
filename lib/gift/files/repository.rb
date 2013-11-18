require_relative 'lib.rb'

class Repository
  attr_accessor :name, :url, :commits, :remote, :location, :last_commit
  
  def initialize(url)
  	@url = url
  end

  def clone_to(location)
    Git::Lib.new.clone @url, location 
  end
  def remote=(remote_name)
    @remote = remote_name
    Git::Lib.new.remote_add @remote, @url, @location
  end
  
  def pull(branch)
  	@last_commit = Commit.new Commit.last_commit(@location), @location
  	Git::Lib.new.pull @remote, branch
  end

  def chages
  	latest_commit = Commit.new Commit.last_commit(@location), @location
  	@last_commit - latest_commit
  end
end

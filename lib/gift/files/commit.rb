#Commit stores the sha of a commit and 
#operations associated with that commit
require_relative 'lib.rb'
require_relative 'diff.rb'

class Commit
  attr_accessor :id, :git_location
  def self.last_commit(git_location)
    Git::Lib.new.sha_last_commit git_location
  end
  
  def initialize(id, git_location)
    @id = id
    @git_location = git_location
  end
  
  def diff(other_commit)
    #find the difference happened between
    #self and other_commit.
    # commit1 diff commit2 :=> Diff instance
    diff = Diff.new @id , other_commit.id, @git_location
    
    diff.old_commit  = @id
    diff.new_commit  = other_commit.id

    git_lib = Git::Lib.new
    
    deltas = git_lib.delta @id, other_commit.id, @git_location
    diff.files = deltas
    diff
  end

  alias - diff
end

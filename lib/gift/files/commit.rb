#Commit stores the sha of a commit and 
#operations associated with that commit
require_relative 'lib.rb'
require_relative 'diff.rb'

class Commit
  attr_accessor :id
  
  def diff(other_commit)
    #find the difference happened between
    #self and other_commit.
    # commit1 diff commit2 :=> Diff instance
    diff = Diff.new
    
    diff.old_commit  = @id
    diff.new_commit  = other_commit.id

    git_lib = Git::Lib.new
    
    deltas = git_lib.delta @id, other_commit.id
    diff.files = deltas
    diff
  end

  alias - diff
end

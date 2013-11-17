#Diff object will store the oldest commit sha, 
#latest commit sha and obtain the files that
#changed in between both the commits
 
class Diff
  attr_accessor :old_commit, :new_commit, :files, :git_location
  def initialize(oldc, newc, git_location)
    @old_commit = oldc
    @new_commit = newc
    @git_location = git_location
    @files = self.files_diffed
  end

  def files_diffed
    Git::Lib.new.delta @old_commit, @new_commit, @git_location    
  end

  def old_commit=(old_commit)
    @old_commit = old_commit
    @files = self.files_diffed
  end
  def new_commit=(new_commit)
    @new_commit = new_commit
    @files += self.files_diffed
  end
end

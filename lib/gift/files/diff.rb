#Diff object will store the oldest commit sha, 
#latest commit sha and obtain the files that
#changed in between both the commits
 
class Diff
  attr_accessor :old_commit, :new_commit, :files
  def intialize(oldc, newc)
    @old_commit = oldc
    @new_commit = newc
    @files = self.files_diffed
  end

  def files_diffed
    Git::Lib.new.diff @old_commit, @new_commit    
  end

  def old_commit=(old_commit)
    @old_commit = old_commit
    @files = self.files_diffed
  end
  def new_commit=(new_commit)
    @new_commit = new_commit
    @files+ = self.files_diffed
  end
end

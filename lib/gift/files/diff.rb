#Diff object will store the oldest commit sha, 
#latest commit sha and obtain the files that
#changed in between both the commits
 
class Diff
  attr_accessor :old_commit, :new_commit, :files
end

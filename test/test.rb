require_relative '../lib/gift/files/repository.rb'
require_relative '../lib/gift/files/lib.rb'
require_relative '../lib/gift/files/diff.rb'
require_relative '../lib/gift/files/commit.rb'

# repo = Repository.new "https://github.com/bgrins/videoconverter.js.git"
# repo.clone_to "/tmp/test"

diff = Diff.new 'f4cf2a58445b57', '6bd65ac1acaf', "/tmp/test"
p diff.files_diffed 

commit_a = Commit.new 'f4cf2a58445b57', "/tmp/test"
commit_b = Commit.new '6bd65ac1acaf', "/tmp/test"
commit_a - commit_b
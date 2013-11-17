module Git
  class Lib
    def initialize
    end

    def delta(commit_one, commit_two, git_folder_location)
      `git --git-dir='#{git_folder_location}/.git' diff #{commit_one} #{commit_two}  --name-only`.split "\n"
    end

    def clone(repository_url, location)
      `git clone #{repository_url} #{location}`
    end
  end
end

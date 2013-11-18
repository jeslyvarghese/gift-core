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

    def pull(branch, location)
      `git --git-dir='#{git_folder_location}/.git'  pull origin #{branch}`
    end

    def remote_add(remote_name, repository_url, location)
      `git --git-dir='#{git_folder_location}/.git' remote add #{remote_name} #{repository_url}`
    end

    def sha_last_commit(location)
      `git --git-dir='#{git_folder_location}/.git' log --pretty="%h" -1`
    end
  end
end

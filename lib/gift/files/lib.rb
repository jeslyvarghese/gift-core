module Git
  class Lib
    def initialize
    end

    def delta(commit_one, commit_two)
      `git diff --name-only #{commit_one} #{commit_two}`.split '\n'
    end

    def clone(repository_url, location)
      `git clone #{repository_url} #{location}`
    end
  end
end

require "lgit/version"

module Lgit
  class Git
    def refresh_master
      `git checkout master`
      `git pull`
    end

    def get_branch
      `git name-rev --name-only HEAD`.strip
    end

    def create_branch(name)
      if name
        refresh_master
        `git checkout -b #{name}`
      end
    end

    def rebase
      refresh_master
      `git checkout - `
      `git rebase master`
    end

    def delete_branches
      `git fetch -p`      
      `git branch -vv`
        .split("\n")
        .reject { |branch| branch.start_with?('*') }
        .select { |branch| branch.include?(': gone]') }
        .map! { |branch| branch.match(/^\s+(.*?)\s/)[1] }
        .each do branch           
          `git branch -D #{branch}`
          puts "#{branch} deleted"
        end
    end
  end
end

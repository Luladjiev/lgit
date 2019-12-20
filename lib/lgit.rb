require 'lgit/version'

module Lgit
  ###
  # Git related class
  class Git
    def refresh_base(base = 'master')
      `git checkout #{base}`
      `git pull`
    end

    def get_branch
      `git name-rev --name-only HEAD`.strip
    end

    def create_branch(name, base = 'master')
      return unless name

      refresh_base base
      `git checkout -b #{name}`
    end

    def rebase(base = 'master')
      refresh_base base
      `git checkout - `
      `git rebase #{base}`
    end

    def delete_branches
      `git fetch -p`
      `git branch -vv`
        .split("\n")
        .reject { |branch| branch.start_with?('*') }
        .select { |branch| branch.include?(': gone]') }
        .map! { |branch| branch.match(/^\s+(.*?)\s/)[1] }
        .each do |branch|
          `git branch -D #{branch}`
          puts "#{branch} deleted"
        end
    end
  end
end

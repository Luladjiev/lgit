require 'lgit/version'
require 'open3'

module Lgit
  ###
  # Git related class
  class Git
    def refresh_base(base)
      base ||= get_default_branch

      `git checkout #{base}`
      `git pull`
    end

    def get_branch
      `git branch --show-current`.strip
    end

    def get_default_branch
      stdout, _, status = Open3.capture3("git symbolic-ref refs/remotes/origin/HEAD")

      return `git config init.defaultBranch`.strip if status != 0

      stdout.strip[20..-1]
    end

    def create_branch(name, base)
      return unless name

      base ||= get_default_branch

      refresh_base base
      `git checkout -b #{name}`
    end

    def rebase(base)
      base ||= get_default_branch

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

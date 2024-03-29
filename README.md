⚠️**IMPORTANT NOTICE**⚠️

This project is no longer maintained. A newer version of this tool has been developed which includes additional features and improvements. Please visit [lgit-rs](https://github.com/Luladjiev/lgit-rs)

# Lgit

Git utility gem.

Write less do more with git.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lgit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lgit

## Usage

Rebase current branch from specified base or master by default

```shell
lgit rebase [<base>]
```

Create new branch from freshly pulled base or master by default

```shell
lgit branch <name> [<base>]
```

Delete all branches for which remotes are gone. *Use with caution!*

```shell
lgit delete-branches
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/luladjiev/lgit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lgit project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Luladjiev/lgit/blob/master/CODE_OF_CONDUCT.md).

[![Gem Version](https://badge.fury.io/rb/mina-hipchat.svg)](http://badge.fury.io/rb/mina-hipchat) [![Build Status](https://travis-ci.org/apertureless/mina-hipchat.svg?branch=master)](https://travis-ci.org/apertureless/mina-hipchat) [![Dependency Status](https://gemnasium.com/apertureless/mina-hipchat.svg)](https://gemnasium.com/apertureless/mina-hipchat)

# Mina-Hipchat
Mina-Hipchat is a small gem for sending mina deploy notifications to HipChat.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mina-hipchat'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mina-hipchat

## Usage example

It is more save to use the room id instead of the room name. This way it works even if you're room name have spaces in it.

    require 'mina/hipchat'
    …

    # Required data
    set :hipchat_room, 'room_1' # roomname or id
    set :hipchat_token, 'xxx' # auth token

    # Optional Data
    set :hipchat_application, 'My Cool App' # application  name
    set :hipchat_color, 'red' # Color it red. or "yellow", "green", "purple", "random" (default "yellow")
    set :hipchat_notify, true # Send notifications to users (default false)




## Available tasks

- ```invoke :'hipchat:starting_deploy'```
- ```invoke :'hipchat:finished_deploy'```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/apertureless/mina-hipchat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

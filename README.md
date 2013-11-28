# Capistrano::Newrelic


## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-newrelic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-newrelic

## Usage
   # Capfile

        require 'capistrano/newrelic'


Configurable options, shown here with defaults:
      set :newrelic_env, fetch(:rack_env, fetch(:rails_env, 'production'))
      set :newrelic_appname, fetch(:application)

Mandatory options:
      :newrelic_license_key

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

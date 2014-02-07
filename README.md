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

License key and application name are retrieved from newrelic.yml.

Configurable options, shown here with defaults:

      # New Relic environment to deploy to. Sets config based on section of newrelic.yml
      set :newrelic_env, fetch(:stage, fetch(:rack_env, fetch(:rails_env, 'production')))
      # Deployment changelog
      set :newrelic_changelog, ""
      # Deployment description
      set :newrelic_desc, ""

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

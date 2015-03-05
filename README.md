# Capistrano::Newrelic


## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-newrelic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-newrelic

## Usage

#### In Capfile

    require 'capistrano/newrelic'

#### In stage files

In your Capfile, or stage configuration files for multi-stage configuration add:

```ruby
    before 'deploy:finished', 'newrelic:notice_deployment'
```
License key and application name are retrieved from `config/newrelic.yml` based
on the environment setting (defaults to value of `rails_env`,
`rack_env` and can be overridden by setting `newrelic_env`).

#### In deploy.rb

Configurable options, shown here with defaults:

```ruby
      # New Relic environment to deploy to. Sets config based on section of newrelic.yml
      set :newrelic_env, fetch(:stage, fetch(:rack_env, fetch(:rails_env, 'production')))

      # Deployment changelog defaults to the git changelog, if using git
      set :newrelic_changelog, "<git changelog if available>"

      # Deployment description
      set :newrelic_desc, ""

      # Deploy user if set will be used instead of the VCS user.
      set :newrelic_deploy_user
```      

## Changelog

0.0.9:
   * Added changelog capture for git
   * Populate revision with `current_revision` from scm if available;
     i.e., the git SHA

0.0.8:
   * Hook was removed, please set it in your deploy.rb or deploy/'stage'.rb
   ```ruby
   before 'deploy:finished', 'newrelic:notice_deployment'
   ```

   * Revision can be set with :
   ```ruby
   set :newrelic_revision, "Your text here"
   ```
   or
   ```ruby
   $ NEWRELIC_REVISION='Your text here' bundle exe cap ....
   ```

## Contributors

- [Bryan Ricker] (https://github.com/bricker)
- [James Kahn] (https://github.com/jisk)
- [Wojciech Wnętrzak] (https://github.com/morgoth)
- [Bill Kayser (New Relic)] (https://github.com/bkayser)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

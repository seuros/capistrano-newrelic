require 'newrelic_rpm'
require 'new_relic/cli/command'

namespace :newrelic do
  desc "Record a deployment in New Relic (newrelic.com)"
  task :notice_deployment do
    changelog = fetch :newrelic_changelog
    if changelog.nil? && fetch(:scm) == :git && !fetch(:previous_revision).nil?
      on primary(:app) do
        within repo_path do
          changelog = capture(:git, "--no-pager log --no-color --pretty=format:'* %an: %s' --abbrev-commit --no-merges #{fetch(:previous_revision)[/^.*$/]}..#{fetch(:current_revision)}")
        end
      end
    end


    run_locally do
      deploy_options = {
          :environment => fetch(:newrelic_env, fetch(:stage, fetch(:rack_env, fetch(:rails_env, fetch(:stage))))),
          :revision => ENV['NEWRELIC_REVISION'] || fetch(:newrelic_revision, fetch(:current_revision, release_timestamp.strip)),
          :description => fetch(:newrelic_desc),
          :user => fetch(:newrelic_deploy_user),
          :appname => fetch(:newrelic_appname) || fetch(:application),
          :license_key => fetch(:newrelic_key)
      }

      deploy_options[:changelog] = changelog unless changelog.nil?

      if deploy_options[:user].nil?
        case fetch(:scm)
          when :git
            git_user = capture('git config user.name', raise_on_non_zero_exit: false).strip
            deploy_options[:user] = git_user unless git_user.empty?
          else
            deploy_options[:user] = ENV['USER']
        end
      end

      debug "Uploading deployment to New Relic"
      begin
        deployment = NewRelic::Cli::Deployments.new deploy_options
        deployment.run
        info "Uploaded deployment information to New Relic"
      rescue => e
        error e
      end

    end
  end
end


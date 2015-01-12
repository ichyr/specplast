set :stage, :production
set :application, "specplast"

set :rbenv_ruby, '2.1.2'

set :scm, :git
set :repo_url,  "git@github.com:ichyr/#{fetch(:application)}.git"
set :branch, 'production'

set :deploy_to, "/home/specplast/webapp"

set :ssh_options, {
  forward_agent: true,
  port: 10375
}

set :log_level, :info

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp vendor/bundle public/system}

SSHKit.config.command_map[:rake]  = "bundle exec rake" #8
SSHKit.config.command_map[:rails] = "bundle exec rails"

set :keep_releases, 10

namespace :deploy do

  desc "Makes sure local git is in sync with remote."
  task :check_revision do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end

  %w[start stop restart].each do |command|
    desc "#{command} Unicorn server."
    task command do
      on roles(:app) do
        execute "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
      end
    end
  end

  before :deploy, "deploy:check_revision"
  after :deploy, "deploy:restart"
  after :rollback, "deploy:restart"

end

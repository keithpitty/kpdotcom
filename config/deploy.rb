set :application, "kpdotcom"
default_run_options[:pty] = true
set :ssh_options, {:forward_agent => true}
set :repository, "git@cockatoosoftware.unfuddle.com:cockatoosoftware/#{application}.git"
set :branch, "master"

set :scm, :git
set :deploy_via, :remote_cache

role :app, "keithpitty.com"
role :web, "keithpitty.com"
role :db,  "keithpitty.com", :primary => true

require "bundler/capistrano"

set :user, "keith"
set :runner, "keith"

# Copy database config file

desc "Copy production database config file."
namespace :deploy do
  task :copy_db_config, :roles => :app do
    db_config = "#{shared_path}/config/database.yml.production"
    run "cp #{db_config} #{release_path}/config/database.yml"
  end
  after "deploy:update_code", "deploy:copy_db_config"
end

# Create symbolic link for expiring headers

desc "Create symbolic link for expiring headers."
namespace :deploy do
  task :create_symlinks, :roles => :app do
    run <<-CMD
      ln -s #{release_path}/public #{release_path}/public/add_expires_header
    CMD
  end
end

# Override app start and restart for Passenger

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
 
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

after "deploy:symlink", "deploy:create_symlinks"
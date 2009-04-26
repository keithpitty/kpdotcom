set :application, "kpdotcom"
default_run_options[:pty] = true
set :ssh_options, {:forward_agent => true}
set :repository, "git@cockatoosoftware.unfuddle.com:cockatoosoftware/#{application}.git"
set :branch, "master"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :deploy_via, :remote_cache

role :app, "keithpitty.com"
role :web, "keithpitty.com"
role :db,  "keithpitty.com", :primary => true

set :user, "keith"
set :runner, "keith"

# Copy database config file

desc "Copy production database config file."
namespace :deploy do
  task :after_update_code, :roles => :app do
    db_config = "#{shared_path}/config/database.yml.production"
    run "cp #{db_config} #{release_path}/config/database.yml"
  end  
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

# Passenger

namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy:symlink", "deploy:create_symlinks"
after :deploy, "passenger:restart"
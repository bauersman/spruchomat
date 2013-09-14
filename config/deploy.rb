set :stages, %w(production staging)
set :default_stage, "staging"

require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :application, "spruchomat"
set :use_sudo, false
ssh_options[:compression] = "none"
set :repository,      "https://github.com/bauersman/spruchomat.git"
default_run_options[:shell] = '/bin/bash'
set :bundle_cmd, 'source $HOME/.bash_profile && bundle'

namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && #{passenger_cmd} start -e #{rails_env} -p #{passenger_port} &"
  end

  task :stop, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && #{passenger_cmd} stop -p #{passenger_port}"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run <<-CMD
      if [[ -f #{current_path}/tmp/pids/passenger.#{passenger_port}.pid ]];
      then
        cd #{current_path} && #{passenger_cmd} stop -p #{passenger_port};
      fi
    CMD

    run "cd #{current_path} && #{passenger_cmd} start -e #{rails_env} -p #{passenger_port} &"
  end

  task :symlink_shared do
    run "ln -nfs #{etc_path}/database.yml #{release_path}/config/database.yml"
  end

  task :symlink_upload_dir do
    run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
after 'deploy:update_code', 'deploy:symlink_upload_dir'

set :stages, %w(production staging)
set :default_stage, "staging"

require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'rvm/capistrano'

set :application, "spruchomat"
set :use_sudo, false
ssh_options[:compression] = "none"
set :repository,      "https://github.com/bauersman/spruchomat.git"
set :bundle_cmd, 'source $HOME/.bash_profile && bundle'
set :rvm_ruby_string, "ruby-1.9.3@wahlplakatomat"
set :rvm_autolibs_flag, "read-only"

namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "touch #{File.join(current_path,'tmp','restart.txt')}"
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

before 'deploy:setup', 'rvm:create_gemset' # only create gemset

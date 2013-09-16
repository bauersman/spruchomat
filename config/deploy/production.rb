set :current_stage,  'production'
set :deploy_to,      "/home/wahlplakatomat/apps/#{application}-#{current_stage}"
set :domain,         "wahlplakatomat.de"
set :user,           "wahlplakatomat"
set :etc_path,       "/home/wahlplakatomat/etc"
set :passenger_port, "17321"
set :passenger_cmd,  "source $HOME/.bash_profile && TMPDIR=#{current_path}/tmp/ bundle exec passenger"

role :app, "78.46.91.204"
role :web, "78.46.91.204"
role :db,  "78.46.91.204", :primary => true

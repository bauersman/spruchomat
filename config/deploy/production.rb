set :current_stage,  'production'
set :deploy_to,      "/home/plakate/spruchomat/apps/#{application}-#{current_stage}"
set :domain,         "volans.uberspace.de"
set :user,           "plakate"
set :etc_path,       "/home/plakate/etc"
set :passenger_port, "17321"
set :passenger_cmd,  "#{bundle_cmd} exec passenger"

role :app, "volans.uberspace.de"
role :web, "volans.uberspace.de"
role :db,  "volans.uberspace.de", :primary => true

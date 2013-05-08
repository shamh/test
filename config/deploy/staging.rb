set :branch, "master"
set :repository,  "git@github.com:shamh/test.git"

role :web, "cidev.gottaparkstaging.com"
role :app, "cidev.gottaparkstaging.com"
#role :db,  "cidev.gottaparkstaging.com", :primary => true

set :deploy_to, "/var/www/vhosts/cidev.gottaparkstaging.com/sham"

set :keep_releases, 8

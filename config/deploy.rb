require 'capistrano/ext/multistage'
set :stages, %w(production staging development)
set :default_stage, "staging"

set :repository,  "git@github.com:shamh/test"
set :scm, :git
set :application, "test"

role :web, "cidev.gottaparkstaging.com"                          # Your HTTP server, Apache/etc
role :app, "cidev.gottaparkstaging.com"                          # This may be the same as your `Web` server

set :user, "www-data"
set :group, "www-data"
set :use_sudo, true

default_run_options[:pty] = true #if you don't do this you'll get a tty sudo error on EC2

set :ssh_options, { :forward_agent => true }
set :port, 22

set :deploy_via, :remote_cache
set :branch, 'master'
set :keep_releases,4

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    sudo "/usr/sbin/apache2ctl graceful" # needs to be exactly in this format - see visudo
  end
end





# config valid only for Capistrano 3.1
# require 'capistrano/ext/multistage'
#lock '3.9.1'

#set :stages, ["production"]
set :default_stage, "production"
set :ssh_options, {:forward_agent => true}

set :application, 'capistrano_example'
set :repo_url, 'git@github.com:yogesh-sinoriya/capistrano-practice.git'
set :user, "deploy"

#set :linked_dirs, %w(node_modules)


namespace :deploy do


    desc 'Print The Server Name'
    task :print_server_name do
      on roles(:app), in: :groups, limit:1 do
        execute "hostname"
      end
    end
end

namespace :npm do

	desc 'Start'
    task :start do
      on roles(:app), in: :groups, limit:1 do
      	execute "cd /usr/share/nginx/node/ && npm start"
        #execute :npm, :start, fetch(:app_command)
      end
    end

    desc 'Restart'
    task :restart do
      on roles(:app), in: :groups, limit:1 do
        execute "cd /usr/share/nginx/node/ && npm restart"
        #execute :npm,:restart, fetch(:app_command)
      end
    end
    desc 'Stop'
    task :stop do
      on roles(:app), in: :groups, limit:1 do
      	execute "cd /usr/share/nginx/node/ && npm stop"
        #execute :npm, :stop, fetch(:app_command)
      end
    end
    desc 'StopAll'
    task :stopall do
      on roles(:app), in: :groups, limit:1 do
      	execute "cd /usr/share/nginx/node/ && npm stopall"
        #execute :npm, :stop, fetch(:app_command)
      end
    end
end


set :ssh_options, { 
  keys: %w(~/.ssh/id_rsa),
  :forward_agent => true,
  auth_methods: %w(publickey)
}

set :keep_releases, 5
set :use_sudo, false

after "deploy:updated", "deploy:print_server_name"

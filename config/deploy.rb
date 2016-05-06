# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'qna'
set :repo_url, 'git@github.com:Sterks/qna.git'

# Default deploy_to directory is /var/www/my_app_name
set :git
set :deploy_to, '/home/deployer/qna'
set :deploy_user, 'deployer'
set :bundle_path, '/home/deployer/qna/shared/bundle'
set :rvm_type, :user

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/private_pub.yml', '.env')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'vendor/bundle')

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do


    desc 'Restart application'
    task :restart do
      on roles(:app), in: :sequence, wait: 5 do
        execute :touch, release_path.join('tmp/restart.txt')
      end
    end

    after :publishing, :restart

end


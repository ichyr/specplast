namespace :setup do

  desc "Upload database.yml file."
  task :upload_yml do
    on roles(:app) do
      # execute "mkdir -p #{shared_path}/config"
      upload! StringIO.new(File.read("config/database.yml")), "#{shared_path}/config/database.yml"
      upload! StringIO.new(File.read(".env.yml")), "/var/www/specplast_prod/current/.env.yml"
    end
  end

  desc "Seed the database."
  task :seed_db do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: :production do
          execute :rake, "db:seed"
        end
      end
    end
  end

  desc "Migrate the database."
  task :migrate_db do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: :production do
          execute :rake, "db:migrate"
        end
      end
    end
  end

  desc "Symlinks config files for Nginx and Unicorn."
  task :symlink_config do
    on roles(:app) do
      execute "rm -f /etc/nginx/sites-enabled/default"

      execute "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
      execute "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{fetch(:application)}"
   end
  end

    desc "Symlink SSL config files for Nginx"
  task :nginx_ssl_test do
    on roles(:app) do
      execute "rm -f /etc/nginx/sites-enabled/default"
      execute "ln -nfs #{current_path}/config/nginx.ssl.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
   end
  end

end

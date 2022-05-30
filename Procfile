predeploy: bundle exec rake webpack:compile
web: bundle exec puma -C config/puma.rb
postdeploy: RAILS_ENV=production bundle exec rails db:migrate
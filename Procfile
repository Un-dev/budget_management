web: bundle exec puma -C config/puma.rb
release: RAILS_ENV=production bundle exec rails db:migrate | bundle exec rake webpacker:compile
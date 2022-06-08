web: bin/webpack && bundle exec puma -C config/puma.rb
release: RAILS_ENV=production bundle exec rails db:migrate && RAILS_ENV=production bundle exec rails assets:precompile
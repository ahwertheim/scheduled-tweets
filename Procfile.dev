web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
js: yarn build --watch
css: yarn build:css --watch
worker: sidekiq
release: bin/rails db:migrate

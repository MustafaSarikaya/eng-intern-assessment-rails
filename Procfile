web: bin/rails server -p ${PORT:-8080} -b 0.0.0.0 -e $RAILS_ENV
release: bin/rails db:schema:load db:seed

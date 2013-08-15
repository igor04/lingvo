require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database  => "./lib/lingvo/db/production.sqlite3"
)

ActiveRecord::Migrator.migrate "./lib/lingvo/db/migration/"

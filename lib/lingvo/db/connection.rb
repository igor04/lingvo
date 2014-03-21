require 'active_record'

module Lingvo
  module DB
    module Connection
      ActiveRecord::Base.establish_connection(
        adapter: "sqlite3",
        database: Config::DB_FILE
      )

      ActiveRecord::Migration.verbose = false
      ActiveRecord::Migrator.migrate "#{Config::LINGVO_DIR}/db/migration/"
    end
  end
end

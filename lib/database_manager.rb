require 'pg'

class DatabaseManager
  def self.setup(database_name, pg = PG)
    @connection = pg.connect(dbname: database_name)
  end

  def self.connection
    @connection
  end

  def self.query(sql_query = "SELECT * FROM entries")
    @connection.exec(sql_query)
  end
end

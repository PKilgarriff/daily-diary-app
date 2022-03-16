require 'pg'

class Diary
  def initialize(postgres = PG, database)
    database_connection(postgres, database)
  end

  def list_all_entries
    output = []
    database_query.each do |row|
      output << "#{row['title']}: #{row['url']}"
    end
    return output
  end

  def database_connection(postgres = PG, database)
    @connection = postgres.connect(dbname: database)
  end

  def database_query
    @connection.exec "SELECT * FROM entries"
  end
end

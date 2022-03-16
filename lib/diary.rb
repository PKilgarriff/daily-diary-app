require 'pg'

class Diary
  def initialize(postgres = PG, database)
    database_connection(postgres, database)
  end

  def list_all_entries
    output = []
    database_query.each do |row|
      output << row['title']
    end
    return output
  end

  def add_entry(entry_hash)
    title = entry_hash['title'] || 'Untitled'
    body = entry_hash['body'] || 'Nothing here, yet...'
    database_query("INSERT INTO entries (title, body) VALUES ('#{title}','#{body}')")
  end

  def database_connection(postgres, database)
    @connection = postgres.connect(dbname: database)
  end

  def database_query(sql_query = "SELECT * FROM entries")
    @connection.exec(sql_query)
  end
end

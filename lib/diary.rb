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

  def add_entry(title)
    database_query("INSERT INTO entries title VALUES ('#{title}')")
  end

  def database_connection(postgres, database)
    @connection = postgres.connect(dbname: database)
  end

  def database_query(sql_query = "SELECT * FROM entries")
    @connection.exec(sql_query)
  end
end

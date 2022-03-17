require_relative 'database_manager'

class Diary
  def initialize(database_manager = DatabaseManager)
    @database_manager = database_manager
  end

  def list_all_entries
    output = []
    @database_manager.query.each do |row|
      output << row['title']
    end
    return output
  end

  def add_entry(entry_hash)
    title = entry_hash['title'] || 'Untitled'
    body = entry_hash['body'] || 'Nothing here, yet...'
    @database_manager.query("INSERT INTO entries (title, body) VALUES ('#{title}','#{body}')")
  end
end

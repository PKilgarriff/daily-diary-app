require 'pg'

module DatabaseHelper
  def setup_test_database
    connection = PG.connect(dbname: 'daily_diary_test')
    
    connection.exec('DROP TABLE IF EXISTS entries;')
    connection.exec('CREATE TABLE entries (id SERIAL PRIMARY KEY, title VARCHAR(60), body VARCHAR(300), time timestamp);')
  end

  def add_default_entries
    connection = PG.connect(dbname: 'daily_diary_test')
    
    defaults = [
      { title: "Tuesday: Hello World!" },
      { title: "Wednesday: Podcasts I Like" },
      { title: "Thursday: St Patrick''s Day" }
      # { title: "Thursday: St Patrick''s Day'); DROP TABLE entries;--;" }
    ]
    
    defaults.each do |entry|
      connection.exec("INSERT INTO entries (title) VALUES ('#{entry[:title]}');")
    end
  end
end

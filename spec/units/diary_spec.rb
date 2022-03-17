require 'diary'

describe Diary do
  let(:fake_entries) do [
    { 'title' => "Tuesday: Hello World!" },
    { 'title' => "Wednesday: Podcasts I Like" },
    { 'title' => "Thursday: St Patrick's Day" }
    ]
  end
  let(:fake_connection) { double(:connection_double, :exec => fake_entries) }
  let(:fake_db_manager) do
    double(
      :db_manager_double,
      :setup => fake_connection,
      :connection => fake_connection,
      :query => fake_entries
      )
    end
  
  subject(:diary) { described_class.new(fake_db_manager) }

  describe '#list_all_entries' do
    it 'returns a list of entries' do
      expected_entries = ["Tuesday: Hello World!", "Wednesday: Podcasts I Like", "Thursday: St Patrick's Day"]
      expect(diary.list_all_entries).to match_array(expected_entries)
    end
  end

  describe '#add_entry' do
    it 'adds a new diary entry' do
      sql_query = "INSERT INTO entries (title, body) VALUES ('Test Title','Nothing here, yet...')"
      diary.add_entry({ 'title' => 'Test Title' })
      expect(fake_db_manager).to have_received(:query).with(sql_query)
    end
  end
end

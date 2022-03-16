require 'diary'

describe Diary do
  let(:fake_diary_entry1) { { 'title' => "Tuesday", 'url' => "Hello World!" } }
  let(:fake_diary_entry2) { { 'title' => "Wednesday", 'url' => "Podcasts I Like" } }
  let(:fake_diary_entry3) { { 'title' => "Thursday", 'url' => "St Patrick's Day" } }
  let(:fake_entries) { [ fake_diary_entry1, fake_diary_entry2, fake_diary_entry3 ] }
  let(:fake_connection) { double(:connection_double, :exec => fake_entries) }
  let(:fake_pg) { double(:pg_double, :connect => fake_connection) }
  subject(:diary) { described_class.new(fake_pg, 'daily_diary_test') }

  describe '#list_all_entries' do
    it 'returns a list of entries' do
      expected_entries = ["Tuesday: Hello World!", "Wednesday: Podcasts I Like", "Thursday: St Patrick's Day"]
      expect(diary.list_all_entries).to match_array(expected_entries)
    end
  end

  describe '#database_connection' do
    it 'connects to daily_dairy database' do
      expect(diary.database_connection(fake_pg, 'daily_diary_test')).to eq fake_connection
    end
  end

  describe '#database_query' do
    it 'sends a query to the daily_dairy database' do
      diary.database_connection(fake_pg, 'daily_diary_test')
      expect(diary.database_query).to eq fake_connection.exec
    end
  end
end

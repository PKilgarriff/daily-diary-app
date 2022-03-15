require 'diary'

describe Diary do
  subject(:diary) { described_class.new }

  describe '#list_all_entries' do
    it 'returns a list of entries' do
      expect(diary.list_all_entries).to eq ("Tuesday: Hello World!\nWednesday: Podcasts I Like\nThursday: St Patrick\\'s Day")
    end
  end
end

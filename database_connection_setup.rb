require './lib/diary'

if ENV['ENVIRONMENT'] == 'test'
  Diary.setup('daily_diary_test')
else
  Diary.setup('daily_diary')
end

require './lib/database_manager'
if ENV['ENVIRONMENT'] == 'test'
  DatabaseManager.setup('daily_diary_test')
else
  # :nocov:
  DatabaseManager.setup('daily_diary')
  # :nocov:
end

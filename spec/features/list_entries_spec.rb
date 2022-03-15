feature 'Diary Entries Page' do
  scenario 'lists the titles of all current diary entries' do
    add_default_entries
    visit ('/diary-entries')
    expect(page).to have_content 'Tuesday: Hello World!'
    expect(page).to have_content 'Wednesday: Podcasts I Forgot'
    expect(page).to have_content "Thursday: St Patrick\\'s Day"
  end
end

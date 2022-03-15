feature 'Home Page' do
  scenario 'User is welcomed when visiting the index' do
    visit ('/')
    expect(page).to have_content 'Welcome to the Daily Diary!'
  end
end

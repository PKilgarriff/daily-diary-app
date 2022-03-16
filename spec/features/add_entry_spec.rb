feature 'Add Entries Page' do
  scenario 'add an entry with a title and a body' do
    title = 'A New Day'
    body = 'What an exciting new diary this is!'
    
    visit ('/')
    click_on 'New Entry'
    fill_in 'title_entry', with: title
    fill_in 'body_entry', with: body
    click_on 'Submit'

    expect(page).to have_button 'View Entries'
    click_on 'View Entries'
    expect(page).to have_content 'A New Day'
  end
end

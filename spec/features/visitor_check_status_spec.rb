require 'rails_helper'

feature 'visitor check status' do
  scenario 'visitor can see his game stats' do
    
    visit root_path
    click_on 'Pesquisar'

    expect(page).to have_content('assists')
    expect(page).to have_content('kills')
    expect(page).to have_content('losses')
  end
end
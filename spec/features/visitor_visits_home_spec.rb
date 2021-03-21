require 'rails_helper'

feature 'visitor visits home page' do
  scenario 'successfully' do
    
    visit root_path

    expect(page).to have_content('Insira o usuário:')
    expect(page).to have_content('PUBG Stats')
    expect(page).to have_button('Pesquisar')
  end
end
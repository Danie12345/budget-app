require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  let(:user) { create(:user) }
  
  before(:each) do
    user.confirm
    sign_in(user)
    @g1 = create(:group, user:)
    @g2 = create(:group, user:, name: 'another category')    
  end

  describe 'index page' do
    before(:example) do
      visit root_path
    end

    it 'shows the name of the page' do
      expect(page).to have_content('Groups')
    end

    it 'shows all group icons' do
      image = page.all('img')
      expect(image.size).to eq(2)
    end

    it 'shows the total amount of each group' do
      expect(page).to have_content(@g1.total)
      expect(page).to have_content(@g2.total)
    end

    it 'redirects to the operations index page when clicking on an individual group' do
      click_on(@g1.name)
      expect(page).to have_current_path group_operations_path(@g1.id)
    end
  end

  describe 'new page' do
    before(:example) do
      visit new_group_path
    end

    it 'shows page title' do
      expect(page).to have_content('New group')
    end

    it 'shows name input field' do
      expect(page).to have_field('Name')
    end

    it 'shows icon input field' do
      expect(page).to have_field('Icon')
    end

    it 'shows submit button' do
      expect(page).to have_button('Save')
    end

    it 'shows a cancel button' do
      expect(page).to have_content('<')
    end

    it 'creates a new group and redirects to the new group' do
      fill_in 'Name', with: 'Languages'
      fill_in 'Icon', with: 'https://cdn-icons-png.flaticon.com/512/1465/1465569.png'
      click_button 'Save'
      group = Group.last
      expect(page).to have_current_path(group_operations_path(group.id))
    end

    it 'goes back and cancels the group creation' do
      click_on '<'
      expect(page).to have_current_path(root_path)
    end
  end
end

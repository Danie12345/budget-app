require 'rails_helper'

RSpec.describe 'Operations', type: :feature do
  let(:user) { create(:user) }
  
  before(:each) do
    user.confirm
    sign_in(user)
    @g = create(:group, user:)
    @o1 = create(:operation, author_id: user.id, amount: 19)
    @o2 = create(:operation, author_id: user.id, name: 'Bottle')
    @g.operations += [@o1, @o2]
  end

  describe 'index page' do
    before(:example) do
      visit group_operations_path(@g.id)
    end

    it 'shows the name of the page' do
      expect(page).to have_content(@g.name)
    end

    it 'shows the total amount of the group' do
      expect(page).to have_content("Total: $#{@g.total}")
    end

    it 'shows the amount of each operation' do
      expect(page).to have_content("Amount: $#{@o1.amount}")
      expect(page).to have_content("Amount: $#{@o2.amount}")
    end

    it 'shows a back button' do
      expect(page).to have_content('<')
    end

    it 'redirects to the home page when clicking on the back button' do
      click_on('<')
      expect(page).to have_current_path root_path
    end

    it 'redirects to the new operation page when clicking on the new operation button' do
      click_on('New operation')
      expect(page).to have_current_path new_operation_path
    end
  end

  describe 'new page' do
    before(:example) do
      visit new_operation_path
    end

    it 'shows page title' do
      expect(page).to have_content('New operation')
    end

    it 'shows name input field' do
      expect(page).to have_field('Name')
    end

    it 'shows icon input field' do
      expect(page).to have_field('Amount')
    end

    it 'shows select group input field' do
      expect(page).to have_select('Group')
    end

    it 'shows submit button' do
      expect(page).to have_button('Create Operation')
    end

    it 'shows a cancel button' do
      expect(page).to have_content('<')
    end

    it 'creates a new group and redirects to the new group' do
      o3 = build(:operation, author_id: user.id, name: 'Test op')
      fill_in 'Name', with: o3.name
      fill_in 'Amount', with: o3.amount
      select @g.name, from: 'Group'
      click_button 'Create Operation'
      expect(page).to have_current_path(group_operations_path(@g.id))
      expect(page).to have_content(o3.name)
      expect(page).to have_content("Amount: $#{o3.amount}")
      expect(page).to have_content("Total: $#{@g.total}")
    end

    it 'goes back and cancels the operation creation' do
      click_on '< Cancel'
      expect(page).to have_content(@g.name)
    end
  end
end

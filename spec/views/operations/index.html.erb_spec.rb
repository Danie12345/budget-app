require 'rails_helper'

RSpec.describe 'operations/index', type: :view do
  before(:each) do
    assign(:operations, [
             Operation.create!(
               name: 'Name',
               amount: '',
               user: nil,
               group: nil
             ),
             Operation.create!(
               name: 'Name',
               amount: '',
               user: nil,
               group: nil
             )
           ])
  end

  it 'renders a list of operations' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: ''.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end

require 'rails_helper'

RSpec.describe 'operations/new', type: :view do
  before(:each) do
    assign(:operation, Operation.new(
                         name: 'MyString',
                         amount: '',
                         user: nil,
                         group: nil
                       ))
  end

  it 'renders new operation form' do
    render

    assert_select 'form[action=?][method=?]', operations_path, 'post' do
      assert_select 'input[name=?]', 'operation[name]'

      assert_select 'input[name=?]', 'operation[amount]'

      assert_select 'input[name=?]', 'operation[user_id]'

      assert_select 'input[name=?]', 'operation[group_id]'
    end
  end
end

require 'rails_helper'

RSpec.describe 'operations/edit', type: :view do
  before(:each) do
    @operation = assign(:operation, Operation.create!(
                                      name: 'MyString',
                                      amount: '',
                                      user: nil,
                                      group: nil
                                    ))
  end

  it 'renders the edit operation form' do
    render

    assert_select 'form[action=?][method=?]', operation_path(@operation), 'post' do
      assert_select 'input[name=?]', 'operation[name]'

      assert_select 'input[name=?]', 'operation[amount]'

      assert_select 'input[name=?]', 'operation[user_id]'

      assert_select 'input[name=?]', 'operation[group_id]'
    end
  end
end

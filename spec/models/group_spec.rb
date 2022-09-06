require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'validations' do
    before do
      @user = create(:user)
      @group = create(:group, user_id: @user.id)
    end
    
    describe 'are valid' do
      it 'when attributes are present' do
        expect(@group).to be_valid
      end
    end
    
    describe 'nil name' do
      it 'is not valid' do
        @group.name = nil
        expect(@group).to_not be_valid
      end
    end
    
    describe 'nil icon' do
      it 'is not valid' do
        @group.icon = nil
        expect(@group).to_not be_valid
      end
    end
    
    describe 'nil user_id' do
      it 'is not valid' do
        @group.user_id = nil
        expect(@group).to_not be_valid
      end
    end
  end
end

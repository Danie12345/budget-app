require 'rails_helper'

RSpec.describe Operation, type: :model do
  context 'validations' do
    before do
      @user = create(:user)
      @operation = create(:operation, author_id: @user.id)
    end
    
    describe 'are valid' do
      it 'when attributes are present' do
        expect(@operation).to be_valid
      end
    end
    
    describe 'nil name' do
      it 'is not valid' do
        @operation.name = nil
        expect(@operation).to_not be_valid
      end
    end
    
    describe 'nil icon' do
      it 'is not valid' do
        @operation.amount = nil
        expect(@operation).to_not be_valid
      end
    end
    
    describe 'nil user_id' do
      it 'is not valid' do
        @operation.author_id = nil
        expect(@operation).to_not be_valid
      end
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    before do 
      @user = create(:user)
    end

    describe 'is valid' do
      it 'when name is present' do
        expect(@user).to be_valid
      end

      it 'when email is present' do
        expect(@user).to be_valid
      end

      it 'when password is present' do
        expect(@user).to be_valid
      end
    end

    describe 'nil name' do
      it 'is not valid' do
        @user.name = nil
        expect(@user).to_not be_valid
      end
    end
    
    describe 'nil email' do
      it 'is not valid' do
        @user.name = nil
        expect(@user).to_not be_valid
      end
    end
    
    describe 'nil password' do
      it 'is not valid' do
        @user.name = nil
        expect(@user).to_not be_valid
      end
    end
  end
end

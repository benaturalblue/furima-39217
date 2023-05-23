require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'postal_code,area_id,city,house_number,phone_number,tokenが存在すれば登録できる' do
        expect(@record_address).to be_valid
      end
      it 'buildingは空でも登録できる' do
        @record_address.building = ''
        expect(@record_address).to be_valid
      end
    end

    context '商品登録できないとき' do
      it 'postal_codeが空では登録できない' do
        @record_address.postal_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'area_idが1では登録できない' do
        @record_address.area_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空では登録できない' do
        @record_address.city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では登録できない' do
        @record_address.house_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeは半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_address.postal_code = 1_234_567
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeは全角数字だと登録できない' do
        @record_address.postal_code = '１２３-４５６７'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'phone_numberは10桁未満だと登録できない' do
        @record_address.phone_number = 123_456_789
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end
      it 'phone_numberは12桁以上だと登録できない' do
        @record_address.phone_number = 112_234_567_890
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'phone_numberは全角数字だと登録できない' do
        @record_address.phone_number = '１２３４５６７８９０'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'tokenが空では登録できないこと' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていなければ登録ができないこと' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ登録ができないこと' do
        @record_address.item_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

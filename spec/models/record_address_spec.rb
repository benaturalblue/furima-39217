require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end
  
  describe '商品購入' do
    context '商品購入できるとき' do
      it 'postal_code,area_id,city,house_number,phone_numberが存在すれば登録できる' do
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
        @record_address.postal_code = 1234567
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeは全角数字だと登録できない' do
        @record_address.postal_code = '１２３-４５６７'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'phone_numberは10桁未満だと登録できない' do
        @record_address.phone_number = 123456789
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it 'phone_numberは12桁以上だと登録できない' do
        @record_address.phone_number = 112234567890
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'phone_numberは全角数字だと登録できない' do
        @record_address.phone_number = '１２３４５６７８９０'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is not a number")
      end
    end
  end
end


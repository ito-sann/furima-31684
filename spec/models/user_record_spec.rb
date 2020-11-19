require 'rails_helper'

RSpec.describe UserRecord, type: :model do
  describe '購入記録と送り先の保存' do
    before do
      @user1 = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @user1.id)
      @user2 = FactoryBot.create(:user)
      @user_record = FactoryBot.build(:user_record, user_id: @user2.id, item_id: @item.id)
      sleep(1)
    end
    describe '商品の保存' do
      context '正常系 商品購入と送り先が保存できる場合' do
        it 'すべての項目を満たせば商品は保存される' do
          expect(@user_record).to be_valid
        end
      end
      context '異常系 商品購入と送り先が保存できない場合' do
        it 'postal_codeがないと商品購入と送り先は保存できない' do
          @user_record.postal_code = ''
          @user_record.valid?
          expect(@user_record.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'region_idがないと商品購入と送り先は保存できない' do
          @user_record.region_id = '0'
          @user_record.valid?
          expect(@user_record.errors.full_messages).to include("Region must be other than 0")
        end
        it 'municipalityがないと商品購入と送り先は保存できない' do
          @user_record.municipality = ''
          @user_record.valid?
          expect(@user_record.errors.full_messages).to include("Municipality can't be blank")
        end
        it 'house_numberがないと商品購入と送り先は保存できない' do
          @user_record.house_number = ''
          @user_record.valid?
          expect(@user_record.errors.full_messages).to include("House number can't be blank")
        end
        it 'phone_numberがないと商品購入と送り先は保存できない' do
          @user_record.phone_number = ''
          @user_record.valid?
          expect(@user_record.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'postal_codeにハイフンがないと商品購入と送り先は保存できない' do
          @user_record.postal_code = '1234567'
          @user_record.valid?
          expect(@user_record.errors.full_messages).to include("Postal code is invalid")
        end
        it 'phone_numberの桁数が１１桁以内でないと商品購入と送り先は保存できない' do
          @user_record.phone_number = '123456789012'
          @user_record.valid?
          expect(@user_record.errors.full_messages).to include("Phone number is invalid")
        end
        it "tokenが空では登録できないこと" do
          @user_record.token = nil
          @user_record.valid?
          expect(@user_record.errors.full_messages).to include("Token can't be blank")
        end
      end    
    end
  end
end    
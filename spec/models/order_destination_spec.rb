require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '商品購入の保存' do
    before do
      @order_destination = FactoryBot.build(:order_destination)
    end

    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@order_destination).to be_valid
    end

    it '配送先の住所として郵便番号がないと保存できない' do
      @order_destination.postal_code = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
    end

    it '配送先の住所として都道府県が選択されていないと保存できない' do
      @order_destination.from_id = '0'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('From Select')
    end

    it '配送先の住所として市区町村がないと保存できない' do
      @order_destination.city = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("City can't be blank")
    end

    it '配送先の住所として電話番号がないと保存できない' do
      @order_destination.phone_number = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
    end

    it '郵便番号は、ハイフンがないと保存できない' do
      @order_destination.postal_code = '1111111'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Postal code is invalid')
    end

    it '電話番号は、11桁以内出ないと保存できない' do
      @order_destination.phone_number = '11111111111111'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
  end
end

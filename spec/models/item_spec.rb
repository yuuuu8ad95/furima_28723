require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/lunch.jpg')
    end

    it 'すべての値が正しく入力されていれば保存できる'   do
      expect(@item).to be_valid
    end

    it '商品名がないと保存できない。' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明がないと保存できない。' do
      @item.explain = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end


    it 'カテゴリーの情報について選択がされていないと保存できない。' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end


    it '商品の状態について選択がされていないと保存できない。' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it '配送料の負担について選択がされていないと保存できない。' do
      @item.cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Cost can't be blank")
    end

    it '発送元の地域について選択がされていないと保存できない。' do
      @item.from_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("From can't be blank")
    end

    it '発送までの日数について選択がされていないと保存できない。' do
      @item.day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end

    it '販売価格についての空だと保存できない。' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '販売価格が300円未満では保存できない。' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it '販売価格が9999999円を超過すると保存できない。' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it '販売価格が全角数字だと、保存ができない' do
      @item.price =  "９９０"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end

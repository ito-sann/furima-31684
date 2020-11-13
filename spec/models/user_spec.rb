require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '正常系 新規登録がうまくいくとき' do
      it '9項目をすべて満たせば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '異常系 新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password_confirmationがpasswordと一致しないと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'kanji_sei_nameが空だと登録できない' do
        @user.kanji_sei_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji sei name can't be blank")
      end
      it 'kanji_mei_nameが空だと登録できない' do
        @user.kanji_mei_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji mei name can't be blank")
      end
      it 'katakana_sei_nameが空だと登録できない' do
        @user.katakana_sei_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana sei name can't be blank")
      end
      it 'katakana_mei_nameが空だと登録できない' do
        @user.katakana_mei_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana mei name can't be blank")
      end
      it 'kanji_sei_nameがカタカナだと登録できない' do
        @user.kanji_sei_name = 'アウトプット'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji sei name is invalid')
      end
      it 'kanji_mei_nameがカタカナだと登録できない' do
        @user.kanji_mei_name = 'アウトプット'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji mei name is invalid')
      end
      it 'katakana_sei_nameが漢字だと登録できない' do
        @user.katakana_sei_name = '可'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana sei name is invalid')
      end
      it 'katakana_mei_nameが漢字だと登録できない' do
        @user.katakana_mei_name = '可'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana mei name is invalid')
      end
      it 'katakana_sei_nameがひらがなだと登録できない' do
        @user.katakana_sei_name = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana sei name is invalid')
      end
      it 'katakana_mei_nameがひらがなだと登録できない' do
        @user.katakana_mei_name = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana mei name is invalid')
      end
    end
  end
end

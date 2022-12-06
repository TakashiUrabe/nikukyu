require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:existed_user) { create(:user) }

  describe 'ユーザー新規作成' do
    context '正常系' do
      it '新規作成ができる' do
        visit new_user_path
        fill_in 'メールアドレス', with: 'test01@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button 'register'
        expect(page).to have_content 'ユーザー登録ができました'
        expect(current_path).to eq root_path
      end
    end

    context '異常系' do
      it 'メールアドレスが未入力の時、新規作成ができない' do
        visit new_user_path
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button 'register'
        expect(current_path).to eq new_user_path
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'メールアドレスを入力してください'
      end

      it 'メールアドレスが登録済の時、新規作成ができない' do
        visit new_user_path
        fill_in 'メールアドレス', with: existed_user.email
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button 'register'
        expect(current_path).to eq new_user_path
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'メールアドレスはすでに存在します'
      end
    end
  end
end

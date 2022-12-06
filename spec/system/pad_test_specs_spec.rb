require 'rails_helper'

RSpec.describe "PadTestSpecs", type: :system do
  describe 'にくきゅう診断' do
    context '正常系' do
      it 'にくきゅう診断ができる' do
        visit new_profile_card_path
        fill_in '名前', with: 'テスト'
        expect(page).to have_checked_field '犬'
        choose '猫'
        expect(page).to have_checked_field '猫'
        attach_file 'profile_card[pad_image]', "#{Rails.root}/spec/fixtures/test_pad.jpeg"
        click_button 'にくきゅう診断をする'
        sleep 5
        expect(current_path).to eq "/result/#{ProfileCard.last.id}"
        expect(page).to  have_content 'タイプ'
      end
    end

    context '異常系' do
      it '名前を入力しない時、にくきゅう診断ができない' do
        visit new_profile_card_path
        fill_in '名前', with: ''
        attach_file 'profile_card[pad_image]', "#{Rails.root}/spec/fixtures/test_pad.jpeg"
        click_button 'にくきゅう診断をする'
        sleep 5
        expect(current_path).to eq new_profile_card_path
        expect(page).to  have_content 'にくきゅう診断ができませんでした'
        expect(page).to  have_content '名前を入力してください'
        expect(page).to  have_content 'にくきゅう診断をしてみよう'
      end

      it 'にくきゅうの写真を選択しない時、にくきゅう診断ができない' do
        visit new_profile_card_path
        fill_in '名前', with: 'テスト'
        click_button 'にくきゅう診断をする'
        sleep 5
        expect(current_path).to eq new_profile_card_path
        expect(page).to  have_content 'にくきゅう診断ができませんでした'
        expect(page).to  have_content 'にくきゅうの写真を入力してください'
        expect(page).to  have_content 'にくきゅう診断をしてみよう'
      end
    end
  end
end

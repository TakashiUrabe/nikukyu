require 'rails_helper'

RSpec.describe "WelcomePages", type: :system do
   describe 'トップページ' do
    context '正常系' do
      it 'トップページが表示される' do
        visit root_path
        expect(current_path).to eq root_path
      end
    end
  end
end

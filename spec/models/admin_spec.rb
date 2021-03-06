require 'rails_helper'

RSpec.describe 'Adminモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    subject { test_admin.valid? }

    let(:admin) { build(:admin) }

    context 'emailカラム' do
      let(:test_admin) { admin }

      it '空欄でないこと' do
        test_admin.email = ''
        is_expected.to eq false
      end
    end

    context 'passwordカラム' do
      let(:test_admin) { admin }

      it '空欄でないこと' do
        test_admin.password = ''
        is_expected.to eq false
      end
    end
  end
end

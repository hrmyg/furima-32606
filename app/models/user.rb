class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'には英字と数字の両方を含めて設定してください'} do
   validates :password
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角漢字、ひらがな、カタカナで入力してください' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A([ァ-ン]|ー)+$\z/, message: 'は全角カタカナで入力してください'} do
    validates :last_name_kana
    validates :first_name_kana
  end
  validates :birthday, presence: true
end

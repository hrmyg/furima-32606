class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do 
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'には英字と数字の両方を含めて設定してください'}
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角漢字、ひらがな、カタカナで入力してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角漢字、ひらがな、カタカナで入力してください' }
    validates :last_name_kana, format: { with: /\A([ァ-ン]|ー)+$\z/, message: 'は全角カタカナで入力してください'}
    validates :first_name_kana, format: { with: /\A([ァ-ン]|ー)+$\z/, message: 'は全角カタカナで入力してください'}
    validates :birthday
  end
end

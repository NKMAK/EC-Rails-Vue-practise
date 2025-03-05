class User < ApplicationRecord
  has_secure_password  # パスワードの暗号化と認証機能
  validates :email, presence: true, uniqueness: true  # メールアドレスのバリデーショ
  has_one :refresh_token, foreign_key: 'user_uuid', primary_key: 'user_uuid'
end

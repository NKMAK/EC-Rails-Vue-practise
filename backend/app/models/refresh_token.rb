class RefreshToken < ApplicationRecord
  belongs_to :user, foreign_key: 'user_uuid', primary_key: 'user_uuid'
end

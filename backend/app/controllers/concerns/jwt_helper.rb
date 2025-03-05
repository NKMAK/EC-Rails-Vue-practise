module JwtHelper
  extend ActiveSupport::Concern

  def generate_jwt(user)
    payload = {
      user_uuid: user.user_uuid,
      exp: 24.hours.from_now.to_i
    }
    JWT.encode(payload, 'sample_secret_key', 'HS256') #TODO 本来は環境変数で隠す
  end

  #try-catch入れたい

  def db_create_refresh_token(user)
    refresh_token_record = RefreshToken.create!(
      user_uuid: user.user_uuid,
      token: SecureRandom.hex(32),
      expires_at: 30.days.from_now
    )
    refresh_token_record 
    return refresh_token_record.token
  end

  def db_update_refresh_token(found_refresh_token)
    found_refresh_token.update!(
      token: SecureRandom.hex(32),
      expires_at: 30.days.from_now
    )
    found_refresh_token.reload
    return found_refresh_token.token
  end
end
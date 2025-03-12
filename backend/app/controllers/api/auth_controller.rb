class Api::AuthController < ApplicationController
  skip_before_action :authenticate_jwt  # 認証をスキップ

  include JwtHelper
  include ActionController::Cookies
  def signup
    user_params = params.require(:user).permit(:username, :email, :password)
    user = User.new(user_params)  
    if user.save
      jwt = generate_jwt(user)
      refresh_token  = db_create_refresh_token(user)

      createCookies(jwt , refresh_token)

      render json: {
        access_token: jwt,  
        refresh_token: refresh_token,
        user_uuid: user.user_uuid
      }
    else
      render json: { errors: user.errors }, status: :unprocessable_entity 
    end
  end

  def login
    user_params = params.require(:user).permit(:email, :password)
    user = User.find_by(email: user_params[:email])
  
    if user&.authenticate(user_params[:password])# ユーザーが存在し、パスワードが一致する場合
      found_refresh_token  = RefreshToken.find_by(user_uuid: user.user_uuid)
      jwt = generate_jwt(user)
      refresh_token  = found_refresh_token ? db_update_refresh_token(found_refresh_token) : db_create_refresh_token(user)

      createCookies(jwt , refresh_token)
      p "okokokokokoko"
      render json: {
        access_token: jwt,  
        refresh_token: refresh_token,
        user_uuid: user.user_uuid
      }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def refresh_token
    token_params = params.require(:user).permit(:user_uuid)
    user = User.find_by(user_uuid: token_params[:user_uuid])

    return render json: { error: 'User not found' }, status: :not_found unless user
    refresh_token = cookies[:refresh_token]
  
    # トークンと有効期限の検証
    refresh_token = RefreshToken.find_by(
      user_uuid: user.user_uuid,
      token: refresh_token,
      expires_at: Time.current..
    )
  
    if refresh_token
      # 新しいJWTトークン生成
      jwt = generate_jwt(user)
      refresh_token = db_update_refresh_token(refresh_token)
      createCookies(jwt , refresh_token)

      render json: { access_token: jwt,
        refresh_token:refresh_token, 
        user_uuid:user.user_uuid 
      }
    else
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end

  private
  def createCookies( jwt, refresh_token )
    cookies[:access_token] = {
      value: jwt,
      httponly: false,
      expires: 30.days.from_now,
      same_site: :lax
    }

    # リフレッシュトークンをhttpOnlyクッキーとして設定
    cookies[:refresh_token] = {
      value: refresh_token,
      httponly: true,
      expires: 30.days.from_now,
      same_site: :lax
    }
  end
end


require "jwt"

class JwtAuthController < ApplicationController
  USERS = { "username" => "password" }.freeze

  # HS256(共通鍵方式)なので、app1とapp2が同じ鍵を持つ必要がある
  SECRET = ENV.fetch("JWT_SHARED_SECRET", "shared-secret-for-lab-please-change")
  AUDIENCE = "app2-system" # このトークンが「誰宛か」を明示する
  EXPIRY = 5.minutes

  def create
    username = params[:username]
    password = params[:password]

    unless USERS[username] && password == USERS[username]
      return render json: { error: "ユーザー名またはパスワードが違います" }, status: :unauthorized
    end

    payload = {
      user_id: username,
      aud: AUDIENCE,
      iat: Time.now.to_i,
      exp: EXPIRY.from_now.to_i
    }

    token = JWT.encode(payload, SECRET, "HS256")

    render json: { jwt: token, expires_in: EXPIRY.to_i }
  end
end

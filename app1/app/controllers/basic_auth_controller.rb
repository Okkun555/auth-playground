# Railsはhttp_basic_authenticate_withヘルパを用意しているが検証の為自作する
class BasicAuthController < ApplicationController
  # MEMO:
  # 検証の為、user_name, passwordは固定値とする
  USERNAME = "username"
  PASSWORD = "password"

  def index
    auth_header = request.headers["Authorization"]

    return render_unauthorized unless auth_header

    schema, encoded_credentials = auth_header.split(" ", 2)
    unless schema == "Basic" && encoded_credentials.present?
      return render_unauthorized
    end

    decoded = Base64.decode64(encoded_credentials)
    user_name, password = decoded.split(":", 2)

    if user_name == USERNAME && password == PASSWORD
      render json: { message: "Basic認証を通過しました", user: user_name }, status: :ok
    else
      render_unauthorized
    end
  end

  private

  def render_unauthorized
    render json: { error: "認証に失敗しました" }, status: :unauthorized
  end
end

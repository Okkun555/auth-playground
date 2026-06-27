class SessionController < ApplicationController
  USERS = { "username" => "password" }.freeze

  def create
    username = params[:username]
    password = params[:password]

    if USERS[username] && USERS[username] == password
      # 検証の為、Redis等には保存せず、Cookie内にセッションIDを載せる
      session[:user_id] = username
      render json: { message: "ログインしました", user: username }
    else
      render json: { error: "ユーザー名またはパスワードが違います" }, status: :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)
    render json: { message: "ログアウトしました" }
  end
end

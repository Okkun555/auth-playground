class ExternalProtectedController < ApplicationController
  # 本来はRailsの credentials や環境変数で管理
  API_KEY = ENV.fetch("EXTERNAL_API_KEY", "test-api-key-please-change")

  before_action :authenticate_api_key

  def index
    render json: { message: "API Keyで保護されたリソースにアクセスできました（app1）" }
  end

  private

  def authenticate_api_key
    presented_key = request.headers["X-Api-Key"]

    unless presented_key && presented_key == API_KEY
      render json: { error: "API Keyが無効です" }, status: :unauthorized
    end
  end
end

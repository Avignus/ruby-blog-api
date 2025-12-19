class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  private

  def authenticate
    # In a real app, you'd check this token against a User's token in the DB
    authenticate_or_request_with_http_token do |token, options|
      # Simple check: Compare token to an ENV variable
      # Ideally: User.find_by(api_key: token)
      ActiveSupport::SecurityUtils.secure_compare(token, ENV['API_KEY'] || "secret-token-123")
    end
  end
end

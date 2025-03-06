class ApplicationController < ActionController::Base
  skip_forgery_protection

  def after_sign_in_path_for(resource)
    Rails.logger.info "✅ after_sign_in_path_for called! Redirecting to users_home_path"
    users_home_path
  end
end

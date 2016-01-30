class Admin::BaseController < ApplicationController
  before_filter :auth

  def auth
    authenticate_or_request_with_http_basic do |user, pass|
      admin = Admin.find_by(name: user)
      admin.match_password pass if admin.presence
    end
  end
end

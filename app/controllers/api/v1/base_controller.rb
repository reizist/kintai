class Api::V1::BaseController < ActionController::Base
  class UnauthorizedError < StandardError; end
  before_action :authorize

  rescue_from UnauthorizedError do
    render text: "Unauthorized!", status: 401
  end

  def authorize
    begin
      @current_user = User.find_by!(uuid: request.headers[:Uuid])
    rescue => e
      raise UnauthorizedError
    end
  end
end
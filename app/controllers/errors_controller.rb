class ErrorsController < ApplicationController
  def not_found
    render(:status => 404)
    skip_authorization
  end

  def internal_server_error
    render(:status => 500)
    skip_authorization
  end
end

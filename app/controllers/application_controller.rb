class ApplicationController < ActionController::Base
  def index
  end

  private

  def render_error(id, status)
    response_body = {
      errors: [
        { id: id, status: status }
      ]
    }

    render json: response_body, status: status
  end
end

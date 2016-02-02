class Api::ApiV1Controller < ApplicationController
  # respond_to :json
  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error

  def render_not_found_error
  	render json: {
  		error: "Error",
  	}, status: :not_found
  end
end

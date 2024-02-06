class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: -> { head :unprocessable_entity }
end

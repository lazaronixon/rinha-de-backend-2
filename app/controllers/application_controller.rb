class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: -> { head :unprocessable_entity }

  before_action :set_client_shard

  wrap_parameters false

  private
    def set_client_shard
      case params[:cliente_id]
      when "1"
        @cliente_shard = :shard_one
      when "2"
        @cliente_shard = :shard_two
      when "3"
        @cliente_shard = :shard_three
      when "4"
        @cliente_shard = :shard_four
      when "5"
        @cliente_shard = :shard_five
      else
        @cliente_shard = :default
      end
    end
end

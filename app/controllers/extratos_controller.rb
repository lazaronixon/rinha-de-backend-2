class ExtratosController < ApplicationController
  def show
    ActiveRecord::Base.connected_to(role: :reading, shard: @cliente_shard) do
      @cliente = Cliente.find(params[:cliente_id])
    end
  end
end

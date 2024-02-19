class TransacoesController < ApplicationController
  def create
    ActiveRecord::Base.connected_to(role: :writing, shard: @cliente_shard) do
      ActiveRecord::Base.transaction do
        @cliente = Cliente.find(params[:cliente_id])
        @cliente.transacoes.create!(transacao_parameters)
      end
    end
  end

  private
    def transacao_parameters
      params.permit(:valor, :tipo, :descricao)
    end
end

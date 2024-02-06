class TransacoesController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      @cliente = Cliente.find(params[:cliente_id])
      @cliente.transacoes.create!(transacao_parameters)
    end
  end

  private
    def transacao_parameters
      params.require(:transacao).permit(:valor, :tipo, :descricao)
    end
end

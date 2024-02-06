class ExtratosController < ApplicationController
  def show
    @cliente = Cliente.find(params[:cliente_id])
  end
end

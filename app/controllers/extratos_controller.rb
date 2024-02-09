class ExtratosController < ApplicationController
  def show
    @cliente = Cliente.find(params[:cliente_id]); fresh_when(@cliente)
  end
end

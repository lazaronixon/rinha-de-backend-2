class Cliente < ApplicationRecord
  has_many :transacoes, -> { order(id: :desc) }

  def saldo_disponivel
    saldo + limite
  end
end

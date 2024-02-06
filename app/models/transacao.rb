class Transacao < ApplicationRecord
  belongs_to :cliente

  enum :tipo, { credito: "c", debito: "d" }, validate: true

  after_create :update_saldo_cliente

  validates :valor, numericality: { only_integer: true, greater_than: 0 }
  validates :descricao, length: { in: 1..10 }
  validate  :client_must_have_available_funds

  private
    def update_saldo_cliente
      cliente.update_column :saldo, saldo_futuro
    end

    def saldo_futuro
      debito? ? (cliente.saldo - valor) : (cliente.saldo + valor)
    end

    def client_must_have_available_funds
      errors.add(:valor, :invalid) if debito? && saldo_futuro_disponivel.negative?
    end

    def saldo_futuro_disponivel
      debito? ? (cliente.saldo_disponivel - valor) : (cliente.saldo_disponivel + valor)
    end
end

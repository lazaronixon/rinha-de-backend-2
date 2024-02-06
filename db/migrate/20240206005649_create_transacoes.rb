class CreateTransacoes < ActiveRecord::Migration[7.1]
  def change
    create_table :transacoes do |t|
      t.integer    :valor,     null: false
      t.string     :tipo,      null: false, limit: 1
      t.string     :descricao, null: false
      t.references :cliente,   null: false, foreign_key: false

      t.datetime :created_at, null: false
    end
  end
end

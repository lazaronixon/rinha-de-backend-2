json.saldo do
  json.total @cliente.saldo
  json.data_extrato Time.current
  json.limite @cliente.limite
end

json.ultimas_transacoes @cliente.transacoes.limit(10) do |transacao|
  json.valor transacao.valor
  json.tipo transacao.tipo_before_type_cast
  json.descricao transacao.descricao
  json.realizada_em transacao.created_at
end

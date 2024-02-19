# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

ActiveRecord::Base.connected_to(role: :writing, shard: :shard_one) do
  Cliente.create_with(nome: "o barato sai caro", limite: 100000).find_or_create_by(id: 1)
end

ActiveRecord::Base.connected_to(role: :writing, shard: :shard_two) do
  Cliente.create_with(nome: "zan corp ltda", limite: 80000).find_or_create_by(id: 2)
end

ActiveRecord::Base.connected_to(role: :writing, shard: :shard_three) do
  Cliente.create_with(nome: "les cruders", limite: 1000000).find_or_create_by(id: 3)
end

ActiveRecord::Base.connected_to(role: :writing, shard: :shard_four) do
  Cliente.create_with(nome: "padaria joia de cocaia", limite: 10000000).find_or_create_by(id: 4)
end

ActiveRecord::Base.connected_to(role: :writing, shard: :shard_five) do
  Cliente.create_with(nome: "kid mais", limite: 500000).find_or_create_by(id: 5)
end

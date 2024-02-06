# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Cliente.upsert_all([
  { id: 1, nome: "o barato sai caro", limite: 100000 },
  { id: 2, nome: "zan corp ltda", limite: 80000 },
  { id: 3, nome: "les cruders", limite: 1000000 },
  { id: 4, nome: "padaria joia de cocaia", limite: 10000000 },
  { id: 5, nome: "kid mais", limite: 500000 }
])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Gerando tipos de pagamento(KindPayment)..."
  KindPayment.create!([{description: "Dinheiro"},
                			 {description: "Cartão"}])
puts "Gerando tipos de pagamento(KindPayment)...[OK]"

puts "Gerando status de pagamento(StatusPayment)..."
  StatusPayment.create!([{description: "Em Análise"},
                			 {description: "Aprovado"},
                			 {description: "Cancelado"},
                			 {description: "Devolvido"}])
puts "Gerando status de pagamento(StatusPayment)...[OK]"

puts "Gerando status do pedido(StatusOrder)..."
  StatusOrder.create!([{description: "Recebido"},
                			 {description: "Aprovado"},
                			 {description: "Emissão de Nota Fiscal"},
                			 {description: "Em Transporte"},
                			 {description: "Emtregue"}])
puts "Gerando status do pedido(StatusOrder)...[OK]"

puts "Gerando categorias(Category)..."
  Category.create!([{description: "Game"},
                			 {description: "Filmes e séries"},
                			 {description: "Bandas"},
                			 {description: "Animes"},
                			 {description: "Desenhos"},
                			 {description: "Programação"}])
puts "Gerando categorias(Category)...[OK]"

puts "Gerando tamanhos(Sizes)..."
  Size.create!([{description: "PP"},
                       {description: "P"},
                       {description: "M"},
                       {description: "G"},
                       {description: "GG"},
                       {description: "GGG"}])
puts "Gerando tamanhos(Sizes)...[OK]"

namespace :utils do
  desc "Popular banco de dados"
  task seed: :environment do
    puts "Gerando Produtos(Products)..."
      20.times do |i|
        figura = Random.rand(1..10)
        Product.create!(
          name: Faker::Name.name,
          description: Faker::Lorem.paragraph,
          price: Faker::Number.decimal(2),
          quantity: Faker::Number.between(1, 50),
          picture: File.open("D:\\PROJETOS RAILS\\kamisetas\\public\\avatars\\camiseta#{figura}.png", "r"),
          category_id: Random.rand(1..6)
        )
      end
    puts "Gerando Produtos(Products)...[OK]"
    
  end

end

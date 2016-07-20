Fabricator :product do
  name Faker::Lorem.word
  description Faker::Lorem.sentence
  category_id :category_id
  price Random.rand 300...1000
  quantity Random.rand 50..100
end

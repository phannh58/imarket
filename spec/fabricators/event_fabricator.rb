Fabricator :event do
  name Faker::Lorem.word
  content Faker::Lorem.sentence
  store_id :store_id
  start_event DateTime.now
  finish_event {DateTime.now + Random.rand(1...3).days}
end

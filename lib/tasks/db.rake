namespace :db do
  desc "remake database data"
  task remake_data: :environment do
    if Rails.env.production?
      puts "Not running in 'Production' task"
    else
      %w[db:drop db:create db:migrate db:seed db:test:prepare].each do |task|
        Rake::Task[task].invoke
      end

      puts "Creating Province"

      province_list = ["Hà Nội", "Đà Nẵng", "TP. Hồ Chí Minh"]
      province_list.each do |province|
        Fabricate :province, name: province
      end

      puts "Creating District"

      district_list = ["Cầu Giấy", "Thanh Khê", "Tân Bình", "Hoàn Kiếm", "Cẩm Lệ",
        "Thủ Đức"]
      district_list.each_with_index do |value, index|
        province_id = index % 3 + 1
        Fabricate :district, name: value, province_id: province_id
      end

      puts "Creating Commerce center, Store Type, Store"

      NUMBER_OF_STORE_TYPE = 6
      NUMBER_OF_STORE_IN_EACH_STORE_TYPE = 2

      commerce_name = ["Big C", "Royal City"]
      district_list.each_with_index do |value, index|
        commerce_name.each do |commerce|
          commerce_center = Fabricate :commerce_center, name: commerce,
            district_id: index + 1
          NUMBER_OF_STORE_TYPE.times do |i|
            store_type = Fabricate :store_type, commerce_center_id: commerce_center.id
            NUMBER_OF_STORE_IN_EACH_STORE_TYPE.times do |j|
              Fabricate :store, store_type_id: store_type.id,
                commerce_center_id: commerce_center.id
            end
          end
        end
      end

      puts "Creating Categories"

      12.times do |i|
        store_id = i + 1
        6.times do |j|
          category = Fabricate :category, store_id: store_id
          12.times do |k|
             Fabricate :product, category_id: category.id
          end
        end
      end

      puts "Creating Evens"

      [*1..3].each do |i|
        Fabricate :event, store_id: i*2
      end

      puts "Creating User"

      user_hash = {
        "Tran Xuan Thang": "tran.xuan.thang",
        "Le Xuan Thong": "le.xuan.thong",
        "Tran Ngoc Linh": "tran.ngoc.linh",
        "Hoang Thi Nhung": "hoang.thi.nhung",
        "Nguyen Binh Dieu": "nguyen.binh.dieu",
        "Chu Anh Tuan": "chu.anh.tuan"
      }

      user_hash.each do |key, value|
        Fabricate :user, full_name: key, email: value + "@framgia.com"
      end

      puts "Creating Store User-Tran Xuan Thang"

      NUMBER_OF_STORE_FOLLOW = 3

      NUMBER_OF_STORE_FOLLOW.times do |i|
        Fabricate :store_user, user_id: 1
      end

      puts "Creating Store User-Le Xuan Thong"

      NUMBER_OF_STORE_FOLLOW.times do |i|
        Fabricate :store_user, user_id: 2
      end
    end
  end
end

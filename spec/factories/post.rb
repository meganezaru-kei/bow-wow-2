FactoryBot.define do
  factory :post do
    title { 'hello!' }
    body { 'hello!hello!' }
    parent_category { '大型犬' }
    child_category { 'ゴールデンレトリバー' }
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
    trait :with_images do
      images { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test-image.png'), 'image/png') }
    end
  end
end

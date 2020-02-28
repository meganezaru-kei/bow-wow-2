# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == 'development'
  # Tag.create([
  #   { name: '柴犬' },
  #   { name: 'ゴールデンレトリバー' },
  #   { name: 'シベリアンハスキー' },
  #   { name: 'ビーグル' },
  #   { name: 'チワワ' },
  #   { name: 'パグ' }
  # ])
  large_dogs = Category.create(name: "大型犬")
  golden_retriever = large_dogs.children.create(name: "ゴールデンレトリバー")
  siberian_husky = large_dogs.children.create(name: "シベリアンハスキー")
  akitaken = large_dogs.children.create(name: "秋田県")

  medium_dogs = Category.create(name: "中型犬")
  beagle = medium_dogs.children.create(name: "ビーグル")
  bulldog = medium_dogs.children.create(name: "ブルドッグ")
  border_collie = medium_dogs.children.create(name: "ボーダーコリー")
end

if Rails.env == 'production'
  Tag.create([
    { name: '柴犬' },
    { name: 'ゴールデンレトリバー' },
    { name: 'シベリアンハスキー' },
    { name: 'ビーグル' },
    { name: 'チワワ' },
    { name: 'パグ' }
  ])
end

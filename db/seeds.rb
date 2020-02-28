# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == 'development'
  Tag.create([
    { name: '日常' },
    { name: '散歩' },
    { name: 'ごはん' },
    { name: 'おはよう' },
    { name: 'おやすみ' },
    { name: 'おかえり' },
    { name: 'おでかけ' },
    { name: 'お手' },
    { name: 'おすわり' },
    { name: '子犬' }
  ])
  
  large_dogs = Category.create(name: "大型犬")
  golden_retriever = large_dogs.children.create(name: "ゴールデンレトリバー")
  labrador_retriever = large_dogs.children.create(name: "ラブラドールレトリバー")
  bernese_mountain = large_dogs.children.create(name: "バーニーズマウンテンドッグ")
  standard_poodle = large_dogs.children.create(name: "スタンダードプードル")
  siberian_husky = large_dogs.children.create(name: "シベリアンハスキー")
  great_pyrenees = large_dogs.children.create(name: "グレートピレニーズ")
  flat_coated_retriever = large_dogs.children.create(name: "フラットコーテッドレトリーバー")
  borzoi = large_dogs.children.create(name: "ボルゾイ")
  doberman = large_dogs.children.create(name: "ドーベルマン")
  saint_bernard = large_dogs.children.create(name: "セントバーナード")
  akitaken = large_dogs.children.create(name: "秋田犬")
  tosaken = large_dogs.children.create(name: "土佐犬")
  other_large_dogs = large_dogs.children.create(name: "その他の大型犬")

  medium_dogs = Category.create(name: "中型犬")
  beagle = medium_dogs.children.create(name: "柴犬")
  french_bulldog = medium_dogs.children.create(name: "フレンチブルドッグ")
  welsh_corgi_pembroke = medium_dogs.children.create(name: "ウェルシュコーギーペンブローク")
  boston_terrier = medium_dogs.children.create(name: "ボストンテリア")
  american_cocker_spaniel = medium_dogs.children.create(name: "アメリカンコッカースパニエル")
  beagle = medium_dogs.children.create(name: "ビーグル")
  japan_spitz = medium_dogs.children.create(name: "日本スピッツ")
  bulldog = medium_dogs.children.create(name: "ブルドッグ")
  border_collie = medium_dogs.children.create(name: "ボーダーコリー")
  other_medium_dogs = medium_dogs.children.create(name: "その他の中型犬")
  
  small_dogs = Category.create(name: "小型犬")
  toy_poodle = small_dogs.children.create(name: "トイプードル")
  shih_tzu = small_dogs.children.create(name: "シーズー")
  cavalier = small_dogs.children.create(name: "キャバリア")
  yorkshire_terrier = small_dogs.children.create(name: "ヨークシャテリア")
  maltese = small_dogs.children.create(name: "マルチーズ")
  papillon = small_dogs.children.create(name: "パピヨン")
  miniature_dachshund = small_dogs.children.create(name: "ミニチュアダックスフンド")
  pug = small_dogs.children.create(name: "パグ")
  chihuahua = small_dogs.children.create(name: "チワワ")
  pomeranian = small_dogs.children.create(name: "ポメラニアン")
  other_small_dogs = small_dogs.children.create(name: "その他の小型犬")
end

if Rails.env == 'production'
  Tag.create([
    { name: '日常' },
    { name: '散歩' },
    { name: 'ごはん' },
    { name: 'おはよう' },
    { name: 'おやすみ' },
    { name: 'おかえり' },
    { name: 'おでかけ' },
    { name: 'お手' },
    { name: 'おすわり' },
    { name: '子犬' }
  ])
  
  large_dogs = Category.create(name: "大型犬")
  golden_retriever = large_dogs.children.create(name: "ゴールデンレトリバー")
  labrador_retriever = large_dogs.children.create(name: "ラブラドールレトリバー")
  bernese_mountain = large_dogs.children.create(name: "バーニーズマウンテンドッグ")
  standard_poodle = large_dogs.children.create(name: "スタンダードプードル")
  siberian_husky = large_dogs.children.create(name: "シベリアンハスキー")
  great_pyrenees = large_dogs.children.create(name: "グレートピレニーズ")
  flat_coated_retriever = large_dogs.children.create(name: "フラットコーテッドレトリーバー")
  borzoi = large_dogs.children.create(name: "ボルゾイ")
  doberman = large_dogs.children.create(name: "ドーベルマン")
  saint_bernard = large_dogs.children.create(name: "セントバーナード")
  akitaken = large_dogs.children.create(name: "秋田犬")
  tosaken = large_dogs.children.create(name: "土佐犬")
  other_large_dogs = large_dogs.children.create(name: "その他の大型犬")

  medium_dogs = Category.create(name: "中型犬")
  beagle = medium_dogs.children.create(name: "柴犬")
  french_bulldog = medium_dogs.children.create(name: "フレンチブルドッグ")
  welsh_corgi_pembroke = medium_dogs.children.create(name: "ウェルシュコーギーペンブローク")
  boston_terrier = medium_dogs.children.create(name: "ボストンテリア")
  american_cocker_spaniel = medium_dogs.children.create(name: "アメリカンコッカースパニエル")
  beagle = medium_dogs.children.create(name: "ビーグル")
  japan_spitz = medium_dogs.children.create(name: "日本スピッツ")
  bulldog = medium_dogs.children.create(name: "ブルドッグ")
  border_collie = medium_dogs.children.create(name: "ボーダーコリー")
  other_medium_dogs = medium_dogs.children.create(name: "その他の中型犬")
  
  small_dogs = Category.create(name: "小型犬")
  toy_poodle = small_dogs.children.create(name: "トイプードル")
  shih_tzu = small_dogs.children.create(name: "シーズー")
  cavalier = small_dogs.children.create(name: "キャバリア")
  yorkshire_terrier = small_dogs.children.create(name: "ヨークシャテリア")
  maltese = small_dogs.children.create(name: "マルチーズ")
  papillon = small_dogs.children.create(name: "パピヨン")
  miniature_dachshund = small_dogs.children.create(name: "ミニチュアダックスフンド")
  pug = small_dogs.children.create(name: "パグ")
  chihuahua = small_dogs.children.create(name: "チワワ")
  pomeranian = small_dogs.children.create(name: "ポメラニアン")
  other_small_dogs = small_dogs.children.create(name: "その他の小型犬")
end

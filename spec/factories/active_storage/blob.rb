FactoryBot.define do
  factory :blob, class: ActiveStorage::Blob do
    sequence(:key) { SecureRandom.urlsafe_base64 }  # ユニークなキーでなければならない
    filename { 'test_image.png' }
    content_type { 'image/png' }
    metadata { '' }
    byte_size { 13317 }
    checksum { 'R-EvpP3cJEEQCSwQq/FRCF==' }

    after(:create) do |blob|
      path = blob.service.send(:path_for, blob.key)
      FileUtils.mkdir_p(File.dirname(path))
      FileUtils.copy_file("#{Rails.root}/spec/images/test_image.png", path) # テストファイル image.png をファイルアップロード後の場所に移動する
    end
  end
end
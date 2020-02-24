FactoryBot.define do
  factory :attachment, class: ActiveStorage::Attachment do
    name { "" }
    record_type { "" }
    record_id { 0 }
    association :blob, factory: :blob
  end
end
require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    context '保存できる場合' do
      it 'title, body, images, parent_category, child_categoryが存在すれば保存できること' do
        post = build(:post, :with_images)
        expect(post).to be_valid
      end

      it 'titleが50文字以下だと保存できること' do
        characters = 'a' * 50
        post = build(:post, :with_images, title: characters)
        expect(post).to be_valid
      end

      it 'bodyが1000文字以下だと保存できること' do
        characters = 'a' * 1000
        post = build(:post, :with_images, body: characters)
        expect(post).to be_valid
      end
    end

    context '保存できない場合' do
      it 'titleが空では保存できないこと' do
        post = build(:post, :with_images, title: nil)
        post.valid?
        expect(post.errors[:title]).to include('が入力されていません。')
      end

      it 'titleが51文字以上だと保存できないこと' do
        characters = 'a' * 51
        post = build(:post, :with_images, title: characters)
        post.valid?
        expect(post.errors[:title]).to include('は50文字以下に設定して下さい。')
      end

      it 'bodyが空では保存できないこと' do
        post = build(:post, :with_images, body: nil)
        post.valid?
        expect(post.errors[:body]).to include('が入力されていません。')
      end

      it 'bodyが1001文字以上だと保存できないこと' do
        characters = 'a' * 1001
        post = build(:post, :with_images, body: characters)
        post.valid?
        expect(post.errors[:body]).to include('は1000文字以下に設定して下さい。')
      end

      it 'parent_categoryが空では保存できないこと' do
        post = build(:post, :with_images, parent_category: nil)
        post.valid?
        expect(post.errors[:parent_category]).to include('が入力されていません。')
      end

      it 'child_categoryが空では保存できないこと' do
        post = build(:post, :with_images, child_category: nil)
        post.valid?
        expect(post.errors[:child_category]).to include('が入力されていません。')
      end

      it 'imagesが空では保存できないこと' do
        post = build(:post)
        post.valid?
        expect(post.errors[:images]).to include('が入力されていません。')
      end
    end
  end
end

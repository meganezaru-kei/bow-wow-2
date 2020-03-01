require 'rails_helper'

describe PostsController do
  describe 'GET #index' do
    it '投稿が新着順に表示されること' do
      posts = create_list(:post, 3, :with_images)
      get :index
      expect(assigns(:posts)).to match(posts.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it 'indexテンプレートをレンダリングすること' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'リクエストされたpostのパラメータが@postに割り当てられていること' do
      post = create(:post, :with_images)
      get :show, params: { id: post }
      expect(assigns(:post)).to eq post
    end
    
    it 'showテンプレートをレンダリングすること' do
      post = create(:post, :with_images)
      get :show, params: { id: post }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'newテンプレートをレンダリングすること' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'リクエストされたpostのパラメータが@postに割り当てられていること' do
      post = create(:post, :with_images)
      get :edit, params: { id: post }
      expect(assigns(:post)).to eq post
    end

    it 'editテンプレートをレンダリングすること' do
      post = create(:post, :with_images)
      get :edit, params: { id: post }
      expect(response).to render_template :edit
    end
  end
end

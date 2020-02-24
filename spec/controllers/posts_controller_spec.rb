require 'rails_helper'

describe PostsController do
  describe 'GET #new' do
    it "newテンプレートをレンダリングすること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "リクエストされたpostのパラメータが@postに割り当てられていること" do
      # post = create(:post)
      # get :edit, params: { id: post }
      # expect(assigns(:post)).to eq post
    end

    it "editテンプレートをレンダリングすること" do
      # post = create(:post)
      # get :edit, params: { id: post }
      # expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "投稿が新着順に表示されること" do
      # posts = create_list(:post, 3)
      # get :index
      # expect(assigns(:posts)).to match(posts.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "indexテンプレートをレンダリングすること" do
      get :index
      expect(response).to render_template :index
    end
  end
end
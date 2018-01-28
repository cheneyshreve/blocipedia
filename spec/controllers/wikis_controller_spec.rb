require 'rails_helper'
require 'devise'

RSpec.describe WikisController, type: :controller do
  let(:my_user) { User.create!(email: 'blochead@bloc.io', password: 'password', password_confirmation: 'password') }
  let(:my_wiki) { Wiki.create!(user: my_user, title: "New wiki title", body: "New wiki body", private: false) }

  describe "GET #index" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
   it "returns http success" do
     get :show, params: { id: my_wiki.id }
     expect(response).to have_http_status(:success)
   end
    it "returns renders the #show view" do
      get :show, params: {id: my_wiki.id }
      expect(response).to render_template :show
    end
  end

#
  describe "GET #new" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, params: { id: my_wiki.id }
      expect(response).to render_template :new
    end

    it "instantiates @wiki" do
      get :new, params: { id: my_wiki.id }
      expect(assigns(:wiki)).not_to be_nil
    end
  end

  describe "GET #edit" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
    it "returns http success" do
      get :edit, params: {id: my_wiki.id }
      expect(response).to render_template :edit
    end
  end

  describe "POST create" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end

    it "assigns the new wiki to @wiki" do
      post :create, params: { id: my_wiki.id, wiki: { title: "new wiki title", body: "new wiki body" } }
      expect(assigns(:wiki)).to eq Wiki.last
    end

    # need to update this one
    it "redirects to the new wiki" do
      post :create, params: { id: my_wiki.id, wiki: { title: "new wiki title", body: "new wiki body" } }
      expect(response).to redirect_to(wikis_url)
    end
end

describe "DELETE destroy" do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end
   it "returns http redirect" do
     delete :destroy, params: { id: my_wiki.id }
     expect(response).to redirect_to(wikis_path)
   end
 end


end

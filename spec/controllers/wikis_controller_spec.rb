require 'rails_helper'
require 'devise'

RSpec.describe WikisController, type: :controller do
  let(:my_user) { User.create!(email: 'blochead@bloc.io', password: 'password', password_confirmation: 'password') }
  let(:my_wiki) { Wiki.create!(user: my_user, title: "New wiki title", body: "New wiki body", private: false) }


  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index, params: { id: my_user.id}
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #    it "assigns [my_wiki] to @wikis" do
  #      get :index, params: { id: my_wiki.id }
  #      expect(assigns(:wikis)).to eq([my_wiki])
  #    end
  # end

  describe "GET #show" do
   it "returns http success" do
     get :show, params: { id: my_wiki.id, user_id: my_wiki.user_id }
     expect(response).to have_http_status(:success)
   end
    it "returns renders the #show view" do
      get :show, params: {id: my_wiki.id, user_id: my_user.id }
      expect(response).to render_template :show
    end
  end
  #
  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end

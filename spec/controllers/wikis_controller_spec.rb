require 'rails_helper'

RSpec.describe WikisController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_wiki) { create(:wiki, user: my_user) }

  context "guest user" do

    describe "GET #index" do
      it "should redirect to login" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, id: my_wiki.id
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "GET #new" do
      it "should redirect to login" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "POST #create" do
      it "should redirect to login" do
        post :create, wiki: {title: "title", body: "body"}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context "signed in user" do
    before(:each) do
      request.env["HTTP_REFERER"] = "where_i_came_from"
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in my_user
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns Wiki.all to @wikis" do
        get :index
        expect(assigns(:wikis)).to eq(Wiki.all)
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, id: my_wiki.id
        expect(response).to have_http_status(:success)
      end

      it "assigns [my_wiki] to @wiki" do
        get :show, id: my_wiki.id
        expect(assigns(:wiki)).to eq(my_wiki)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "instantiate @wiki" do
        get :new
        expect(assigns(:wiki)).not_to be_nil
      end
    end

    describe "POST #create" do
      it "increases the number of Wiki by 1" do
        expect { create(:wiki, user: my_user)  }.to change(Wiki, :count).by(1)
      end

      it "assigns the new wiki to @wiki" do
        post :create, wiki: {title: "title", body: "body"}
        expect(assigns(:wiki)).to eq Wiki.last
      end

      it "redirects to the new wiki" do
        post :create, wiki: {title: "title", body: "body"}
        expect(response).to redirect_to Wiki.last
      end
    end
  end


  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
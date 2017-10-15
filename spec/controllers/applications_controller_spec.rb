require 'rails_helper'

RSpec.describe ApplicationsController, type: :controller do
  let(:my_application){Application.create!(name: "New Name", url: "New URL")}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_application] to @applications" do
      get :index
      expect(assigns(:applications)).to eq([my_application])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: my_application.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { id: my_application.id }
      expect(response).to render_template :show
    end

    it "assigns my_application to @application" do
      get :show, params: { id: my_application.id }
      expect(assigns(:application)).to eq(my_application)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @application" do
      get :new
      expect(assigns(:application)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of applications by 1" do
      expect{ post :create, params: { application: { name: "New Name", url: "New URL"} } }.to change(Application,:count).by(1)
    end

    it "assigns the new application to @application" do
      post :create, params: { application: { name: "New Name", url: "New URL"}}
      expect(assigns(:application)).to eq Application.last
    end

    it "redirects to the new application" do
      post :create, params: { application: { name: "New Name", url: "New URL"}}
      expect(response).to redirect_to Application.last
    end
  end

  describe "DELETE destroy" do
    it "deletes the application" do
      delete :destroy, params: { id: my_application.id }
      count = Application.where({id: my_application.id}).size
      expect(count).to eq 0
    end

    it "redirects to application index" do
      delete :destroy, params: { id: my_application.id }
      expect(response).to redirect_to applications_path
    end
  end

#  describe "GET #edit" do
#    it "returns http success" do
#      get :edit
#      expect(response).to have_http_status(:success)
#    end
#  end

end

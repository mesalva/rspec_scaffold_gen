require 'rails_helper'

RSpec.describe ContentGroupItemController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ContentGroupItem. As you add validations to ContentGroupItem, be sure to
  # adjust the attributes here as well.
  fixtures :all

  let(:valid_attributes) {
    { campo1: nil,campo2: nil }
  }

  let(:invalid_attributes) {
    { { campo1: nil,campo2: nil } }
  }

  def check_all_response_fields
    json = JSON.parse(response.body).symbolize_keys
    valid_attributes.each do |k,v|
      expect(valid_attributes[k]).to eq(json[k])
    end
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ContentGroupItemController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "should retrieve all fields as it were created%>" do
      ContentGroupItem.destroy_all
      content_group_item = ContentGroupItem.create! valid_attributes
      get :index, {}, valid_session
      expect(response.body).to eq([content_group_item].to_json)
      check_all_response_fields  
    end
  end

  describe "GET #show" do
    it "assigns the requested content_group_item as @content_group_item" do
      content_group_item = ContentGroupItem.create! valid_attributes
      get :show, {:id => content_group_item.to_param}, valid_session
      expect(response.body).to eq(content_group_item.to_json)
    end
  end


  describe "POST #create" do
    context "with valid params" do
      it "creates a new ContentGroupItem" do
        expect {
          post :create, {:content_group_item => valid_attributes}, valid_session
        }.to change(ContentGroupItem, :count).by(1)
      end

      it "returns the newly created content_group_item" do
        post :create, {:content_group_item => valid_attributes}, valid_session
        expect(response.body).to eq(ContentGroupItem.last.to_json)
        check_all_response_fields
      end

      it "returns http code created" do
        post :create, {:content_group_item => valid_attributes}, valid_session
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "should not persist record" do
        expect {
          post :create, {:content_group_item => invalid_attributes}, valid_session
        }.to change(ContentGroupItem, :count).by(0)
      end

      it "returns http status unprocessable_entity" do
        post :create, {:content_group_item => invalid_attributes}, valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end


  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { campo1: nil,campo2: nil }
      }

      it "updates the requested content_group_item" do
        content_group_item = ContentGroupItem.create! valid_attributes
        put :update, {:id => content_group_item.to_param, :content_group_item => new_attributes}, valid_session
        content_group_item.reload
        check_all_response_fields
      end

      it "returns the updated content_group_item" do
        content_group_item = ContentGroupItem.create! valid_attributes
        put :update, {:id => content_group_item.to_param, :content_group_item => valid_attributes}, valid_session
        expect(response.body).to eq(ContentGroupItem.last.to_json)
      end

      it "returns http code ok" do
        content_group_item = ContentGroupItem.create! valid_attributes
        put :update, {:id => content_group_item.to_param, :content_group_item => valid_attributes}, valid_session
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do

      it "returns http status unprocessable_entity" do
        content_group_item = ContentGroupItem.create! valid_attributes
        put :update, {:id => content_group_item.to_param, :content_group_item => invalid_attributes}, valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested content_group_item" do
      content_group_item = ContentGroupItem.create! valid_attributes
      expect {
        delete :destroy, {:id => content_group_item.to_param}, valid_session
      }.to change(ContentGroupItem, :count).by(-1)
    end

    it "returns http code no_content" do
      content_group_item = ContentGroupItem.create! valid_attributes
      delete :destroy, {:id => content_group_item.to_param}, valid_session
      expect(response).to have_http_status(:no_content)
    end
  end
  

end
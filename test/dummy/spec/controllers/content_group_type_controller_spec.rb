require 'rails_helper'

RSpec.describe ContentGroupTypeController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ContentGroupType. As you add validations to ContentGroupType, be sure to
  # adjust the attributes here as well.
  fixtures :all

  let(:valid_attributes) {
    { teste: nil }
  }

  let(:invalid_attributes) {
    { { teste: nil } }
  }

  

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ContentGroupTypeController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "should retrieve all fields as it were created%>" do
      ContentGroupType.destroy_all
      content_group_type = ContentGroupType.create! valid_attributes
      get :index, {}, valid_session
      expect(response.body).to eq([content_group_type].to_json)
      json = JSON.parse(response.body).symbolize_keys
      valid_attributes.each do |k,v|
        expect(valid_attributes[k]).to eq(json[k])
      end
    end
  end

  describe "GET #show" do
    it "assigns the requested content_group_type as @content_group_type" do
      content_group_type = ContentGroupType.create! valid_attributes
      get :show, {:id => content_group_type.to_param}, valid_session
      expect(response.body).to eq(content_group_type.to_json)
    end
  end


  describe "POST #create" do
    context "with valid params" do
      it "creates a new ContentGroupType" do
        expect {
          post :create, {:content_group_type => valid_attributes}, valid_session
        }.to change(ContentGroupType, :count).by(1)
      end

      it "returns the newly created content_group_type" do
        post :create, {:content_group_type => valid_attributes}, valid_session
        expect(response.body).to eq(ContentGroupType.last.to_json)
        json = JSON.parse(response.body).symbolize_keys
        valid_attributes.each do |k,v|
          expect(valid_attributes[k]).to eq(json[k])
        end
      end

      it "returns http code created" do
        post :create, {:content_group_type => valid_attributes}, valid_session
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "should not persist record" do
        expect {
          post :create, {:content_group_type => invalid_attributes}, valid_session
        }.to change(ContentGroupType, :count).by(0)
      end

      it "returns http status unprocessable_entity" do
        post :create, {:content_group_type => invalid_attributes}, valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end


  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { teste: nil }
      }

      it "updates the requested content_group_type" do
        content_group_type = ContentGroupType.create! valid_attributes
        put :update, {:id => content_group_type.to_param, :content_group_type => new_attributes}, valid_session
        content_group_type.reload
        json = JSON.parse(response.body).symbolize_keys
        valid_attributes.each do |k,v|
          expect(valid_attributes[k]).to eq(json[k])
        end
      end

      it "returns the updated content_group_type" do
        content_group_type = ContentGroupType.create! valid_attributes
        put :update, {:id => content_group_type.to_param, :content_group_type => valid_attributes}, valid_session
        expect(response.body).to eq(ContentGroupType.last.to_json)
      end

      it "returns http code ok" do
        content_group_type = ContentGroupType.create! valid_attributes
        put :update, {:id => content_group_type.to_param, :content_group_type => valid_attributes}, valid_session
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do

      it "returns http status unprocessable_entity" do
        content_group_type = ContentGroupType.create! valid_attributes
        put :update, {:id => content_group_type.to_param, :content_group_type => invalid_attributes}, valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested content_group_type" do
      content_group_type = ContentGroupType.create! valid_attributes
      expect {
        delete :destroy, {:id => content_group_type.to_param}, valid_session
      }.to change(ContentGroupType, :count).by(-1)
    end

    it "returns http code no_content" do
      content_group_type = ContentGroupType.create! valid_attributes
      delete :destroy, {:id => content_group_type.to_param}, valid_session
      expect(response).to have_http_status(:no_content)
    end
  end
  

end
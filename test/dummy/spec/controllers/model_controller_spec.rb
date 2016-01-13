require 'rails_helper'

RSpec.describe ModelController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Model. As you add validations to Model, be sure to
  # adjust the attributes here as well.
  fixtures :all

  let(:valid_attributes) {
    { teste: nil }
  }

  let(:invalid_attributes) {
    { { teste: nil } }
  }

  def check_#{model_name}_response_fields
    json = JSON.parse(response.body).symbolize_keys
    valid_attributes.each do |k,v|
      expect(valid_attributes[k]).to eq(json[k])
    end
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ModelController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "should retrieve all fields as it were created%>" do
      Model.destroy_all
      model = Model.create! valid_attributes
      get :index, {}, valid_session
      expect(response.body).to eq([model].to_json)
      check_#{model_name}_response_fields  
    end
  end

  describe "GET #show" do
    it "assigns the requested model as @model" do
      model = Model.create! valid_attributes
      get :show, {:id => model.to_param}, valid_session
      expect(response.body).to eq(model.to_json)
    end
  end


  describe "POST #create" do
    context "with valid params" do
      it "creates a new Model" do
        expect {
          post :create, {:model => valid_attributes}, valid_session
        }.to change(Model, :count).by(1)
      end

      it "returns the newly created model" do
        post :create, {:model => valid_attributes}, valid_session
        expect(response.body).to eq(Model.last.to_json)
        check_#{model_name}_response_fields
      end

      it "returns http code created" do
        post :create, {:model => valid_attributes}, valid_session
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "should not persist record" do
        expect {
          post :create, {:model => invalid_attributes}, valid_session
        }.to change(Model, :count).by(0)
      end

      it "returns http status unprocessable_entity" do
        post :create, {:model => invalid_attributes}, valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end


  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { teste: nil }
      }

      it "updates the requested model" do
        model = Model.create! valid_attributes
        put :update, {:id => model.to_param, :model => new_attributes}, valid_session
        model.reload
        check_#{model_name}_response_fields
      end

      it "returns the updated model" do
        model = Model.create! valid_attributes
        put :update, {:id => model.to_param, :model => valid_attributes}, valid_session
        expect(response.body).to eq(Model.last.to_json)
      end

      it "returns http code ok" do
        model = Model.create! valid_attributes
        put :update, {:id => model.to_param, :model => valid_attributes}, valid_session
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do

      it "returns http status unprocessable_entity" do
        model = Model.create! valid_attributes
        put :update, {:id => model.to_param, :model => invalid_attributes}, valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested model" do
      model = Model.create! valid_attributes
      expect {
        delete :destroy, {:id => model.to_param}, valid_session
      }.to change(Model, :count).by(-1)
    end

    it "returns http code no_content" do
      model = Model.create! valid_attributes
      delete :destroy, {:id => model.to_param}, valid_session
      expect(response).to have_http_status(:no_content)
    end
  end
  

end
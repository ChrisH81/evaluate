require 'rails_helper'

RSpec.describe BatchesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Batch. As you add validations to Batch, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BatchesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      batch = Batch.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      batch = Batch.create! valid_attributes
      get :show, params: {id: batch.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      batch = Batch.create! valid_attributes
      get :edit, params: {id: batch.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Batch" do
        expect {
          post :create, params: {batch: valid_attributes}, session: valid_session
        }.to change(Batch, :count).by(1)
      end

      it "redirects to the created batch" do
        post :create, params: {batch: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Batch.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {batch: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested batch" do
        batch = Batch.create! valid_attributes
        put :update, params: {id: batch.to_param, batch: new_attributes}, session: valid_session
        batch.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the batch" do
        batch = Batch.create! valid_attributes
        put :update, params: {id: batch.to_param, batch: valid_attributes}, session: valid_session
        expect(response).to redirect_to(batch)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        batch = Batch.create! valid_attributes
        put :update, params: {id: batch.to_param, batch: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested batch" do
      batch = Batch.create! valid_attributes
      expect {
        delete :destroy, params: {id: batch.to_param}, session: valid_session
      }.to change(Batch, :count).by(-1)
    end

    it "redirects to the batches list" do
      batch = Batch.create! valid_attributes
      delete :destroy, params: {id: batch.to_param}, session: valid_session
      expect(response).to redirect_to(batches_url)
    end
  end

end

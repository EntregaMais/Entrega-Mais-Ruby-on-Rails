require 'rails_helper'

RSpec.describe "/despachantes", type: :request do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Despachante.create! valid_attributes
      get despachantes_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      despachante = Despachante.create! valid_attributes
      get despachante_url(despachante), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Despachante" do
        expect {
          post despachantes_url,
               params: { despachante: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Despachante, :count).by(1)
      end

      it "renders a JSON response with the new despachante" do
        post despachantes_url,
             params: { despachante: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Despachante" do
        expect {
          post despachantes_url,
               params: { despachante: invalid_attributes }, as: :json
        }.to change(Despachante, :count).by(0)
      end

      it "renders a JSON response with errors for the new despachante" do
        post despachantes_url,
             params: { despachante: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested despachante" do
        despachante = Despachante.create! valid_attributes
        patch despachante_url(despachante),
              params: { despachante: new_attributes }, headers: valid_headers, as: :json
        despachante.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the despachante" do
        despachante = Despachante.create! valid_attributes
        patch despachante_url(despachante),
              params: { despachante: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the despachante" do
        despachante = Despachante.create! valid_attributes
        patch despachante_url(despachante),
              params: { despachante: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested despachante" do
      despachante = Despachante.create! valid_attributes
      expect {
        delete despachante_url(despachante), headers: valid_headers, as: :json
      }.to change(Despachante, :count).by(-1)
    end
  end
end

require 'rails_helper'

RSpec.describe "/polis", type: :request do

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
      Poli.create! valid_attributes
      get polis_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      poli = Poli.create! valid_attributes
      get poli_url(poli), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Poli" do
        expect {
          post polis_url,
               params: { poli: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Poli, :count).by(1)
      end

      it "renders a JSON response with the new poli" do
        post polis_url,
             params: { poli: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Poli" do
        expect {
          post polis_url,
               params: { poli: invalid_attributes }, as: :json
        }.to change(Poli, :count).by(0)
      end

      it "renders a JSON response with errors for the new poli" do
        post polis_url,
             params: { poli: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested poli" do
        poli = Poli.create! valid_attributes
        patch poli_url(poli),
              params: { poli: new_attributes }, headers: valid_headers, as: :json
        poli.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the poli" do
        poli = Poli.create! valid_attributes
        patch poli_url(poli),
              params: { poli: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the poli" do
        poli = Poli.create! valid_attributes
        patch poli_url(poli),
              params: { poli: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested poli" do
      poli = Poli.create! valid_attributes
      expect {
        delete poli_url(poli), headers: valid_headers, as: :json
      }.to change(Poli, :count).by(-1)
    end
  end
end

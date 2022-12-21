require 'rails_helper'

RSpec.describe "/trajetos", type: :request do

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
      Trajeto.create! valid_attributes
      get trajetos_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      trajeto = Trajeto.create! valid_attributes
      get trajeto_url(trajeto), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Trajeto" do
        expect {
          post trajetos_url,
               params: { trajeto: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Trajeto, :count).by(1)
      end

      it "renders a JSON response with the new trajeto" do
        post trajetos_url,
             params: { trajeto: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Trajeto" do
        expect {
          post trajetos_url,
               params: { trajeto: invalid_attributes }, as: :json
        }.to change(Trajeto, :count).by(0)
      end

      it "renders a JSON response with errors for the new trajeto" do
        post trajetos_url,
             params: { trajeto: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested trajeto" do
        trajeto = Trajeto.create! valid_attributes
        patch trajeto_url(trajeto),
              params: { trajeto: new_attributes }, headers: valid_headers, as: :json
        trajeto.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the trajeto" do
        trajeto = Trajeto.create! valid_attributes
        patch trajeto_url(trajeto),
              params: { trajeto: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the trajeto" do
        trajeto = Trajeto.create! valid_attributes
        patch trajeto_url(trajeto),
              params: { trajeto: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested trajeto" do
      trajeto = Trajeto.create! valid_attributes
      expect {
        delete trajeto_url(trajeto), headers: valid_headers, as: :json
      }.to change(Trajeto, :count).by(-1)
    end
  end
end

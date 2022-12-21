require 'rails_helper'


RSpec.describe "/cidades", type: :request do

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
      Cidade.create! valid_attributes
      get cidades_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      cidade = Cidade.create! valid_attributes
      get cidade_url(cidade), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Cidade" do
        expect {
          post cidades_url,
               params: { cidade: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Cidade, :count).by(1)
      end

      it "renders a JSON response with the new cidade" do
        post cidades_url,
             params: { cidade: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Cidade" do
        expect {
          post cidades_url,
               params: { cidade: invalid_attributes }, as: :json
        }.to change(Cidade, :count).by(0)
      end

      it "renders a JSON response with errors for the new cidade" do
        post cidades_url,
             params: { cidade: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested cidade" do
        cidade = Cidade.create! valid_attributes
        patch cidade_url(cidade),
              params: { cidade: new_attributes }, headers: valid_headers, as: :json
        cidade.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the cidade" do
        cidade = Cidade.create! valid_attributes
        patch cidade_url(cidade),
              params: { cidade: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the cidade" do
        cidade = Cidade.create! valid_attributes
        patch cidade_url(cidade),
              params: { cidade: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested cidade" do
      cidade = Cidade.create! valid_attributes
      expect {
        delete cidade_url(cidade), headers: valid_headers, as: :json
      }.to change(Cidade, :count).by(-1)
    end
  end
end

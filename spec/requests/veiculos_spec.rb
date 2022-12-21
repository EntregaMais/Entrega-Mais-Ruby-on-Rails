require 'rails_helper'

RSpec.describe "/veiculos", type: :request do

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
      Veiculo.create! valid_attributes
      get veiculos_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      veiculo = Veiculo.create! valid_attributes
      get veiculo_url(veiculo), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Veiculo" do
        expect {
          post veiculos_url,
               params: { veiculo: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Veiculo, :count).by(1)
      end

      it "renders a JSON response with the new veiculo" do
        post veiculos_url,
             params: { veiculo: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Veiculo" do
        expect {
          post veiculos_url,
               params: { veiculo: invalid_attributes }, as: :json
        }.to change(Veiculo, :count).by(0)
      end

      it "renders a JSON response with errors for the new veiculo" do
        post veiculos_url,
             params: { veiculo: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested veiculo" do
        veiculo = Veiculo.create! valid_attributes
        patch veiculo_url(veiculo),
              params: { veiculo: new_attributes }, headers: valid_headers, as: :json
        veiculo.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the veiculo" do
        veiculo = Veiculo.create! valid_attributes
        patch veiculo_url(veiculo),
              params: { veiculo: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the veiculo" do
        veiculo = Veiculo.create! valid_attributes
        patch veiculo_url(veiculo),
              params: { veiculo: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested veiculo" do
      veiculo = Veiculo.create! valid_attributes
      expect {
        delete veiculo_url(veiculo), headers: valid_headers, as: :json
      }.to change(Veiculo, :count).by(-1)
    end
  end
end

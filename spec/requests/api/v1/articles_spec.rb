require 'rails_helper'

RSpec.describe "Api::V1::Articles", type: :request do
  # Helper to parse JSON responses
  def json
    JSON.parse(response.body)
  end

  describe "GET /index" do
    it "returns a success response and list of articles" do
      Article.create!(title: "Rails API Guide", body: "Content here", published: true)
      
      get "/api/v1/articles"
      
      expect(response).to have_http_status(:ok)
      expect(json.size).to eq(1)
      expect(json[0]["title"]).to eq("Rails API Guide")
    end
  end

  describe "POST /create" do
    let(:valid_headers) { { "Authorization" => "Bearer secret-token-123" } }
    let(:valid_attributes) { { article: { title: "New Post", body: "Body", published: true } } }

    context "with valid token" do
      it "creates a new Article" do
        expect {
          post "/api/v1/articles", params: valid_attributes, headers: valid_headers
        }.to change(Article, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end

    context "without token" do
      it "returns unauthorized" do
        post "/api/v1/articles", params: valid_attributes
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end

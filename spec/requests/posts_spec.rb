require 'rails_helper'

RSpec.describe "Posts API", type: :request do
  let(:user) { create(:user) }
  let(:tag) { create(:tag) }
  let(:headers) {
    token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
    { "Authorization" => "Bearer #{token}", "Content-Type" => "application/json" }
  }

  describe "POST /api/v1/posts" do
    context "with valid parameters" do
      it "creates a post" do
        post "/api/v1/posts",
             params: {
               post: {
                 title: "Valid Post",
                 body: "Valid Body",
                 tag_ids: [tag.id]
               }
             }.to_json,
             headers: headers

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)["title"]).to eq("Valid Post")
      end
    end

    context "with no tags" do
      it "returns validation error" do
        post "/api/v1/posts",
             params: {
               post: {
                 title: "Invalid Post",
                 body: "No Tags",
                 tag_ids: []
               }
             }.to_json,
             headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)["tags"]).to include("must have at least one tag")
      end
    end

    context "without authentication" do
      it "returns unauthorized" do
        post "/api/v1/posts",
             params: {
               post: {
                 title: "Failing Post",
                 body: "No Auth",
                 tag_ids: [tag.id]
               }
             }.to_json

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end

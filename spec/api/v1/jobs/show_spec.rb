require "rails_helper"

RSpec.describe "jobs#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/jobs/#{job.id}", params: params
  end

  describe "basic fetch" do
    let!(:job) { create(:job) }

    it "works" do
      expect(JobResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("jobs")
      expect(d.id).to eq(job.id)
    end
  end
end

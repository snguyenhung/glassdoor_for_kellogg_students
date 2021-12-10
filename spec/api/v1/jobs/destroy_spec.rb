require "rails_helper"

RSpec.describe "jobs#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/jobs/#{job.id}"
  end

  describe "basic destroy" do
    let!(:job) { create(:job) }

    it "updates the resource" do
      expect(JobResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Job.count }.by(-1)
      expect { job.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end

require "rails_helper"

RSpec.describe "jobs#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/jobs/#{job.id}", payload
  end

  describe "basic update" do
    let!(:job) { create(:job) }

    let(:payload) do
      {
        data: {
          id: job.id.to_s,
          type: "jobs",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(JobResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { job.reload.attributes }
    end
  end
end

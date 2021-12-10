require 'rails_helper'

RSpec.describe "jobs#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/jobs", params: params
  end

  describe 'basic fetch' do
    let!(:job1) { create(:job) }
    let!(:job2) { create(:job) }

    it 'works' do
      expect(JobResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['jobs'])
      expect(d.map(&:id)).to match_array([job1.id, job2.id])
    end
  end
end

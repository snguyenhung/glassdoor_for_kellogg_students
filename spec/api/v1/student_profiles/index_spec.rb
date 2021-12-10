require 'rails_helper'

RSpec.describe "student_profiles#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/student_profiles", params: params
  end

  describe 'basic fetch' do
    let!(:student_profile1) { create(:student_profile) }
    let!(:student_profile2) { create(:student_profile) }

    it 'works' do
      expect(StudentProfileResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['student_profiles'])
      expect(d.map(&:id)).to match_array([student_profile1.id, student_profile2.id])
    end
  end
end

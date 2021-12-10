require "rails_helper"

RSpec.describe "student_profiles#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/student_profiles/#{student_profile.id}"
  end

  describe "basic destroy" do
    let!(:student_profile) { create(:student_profile) }

    it "updates the resource" do
      expect(StudentProfileResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { StudentProfile.count }.by(-1)
      expect { student_profile.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end

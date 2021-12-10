require 'rails_helper'

RSpec.describe StudentProfileResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'student_profiles',
          attributes: { }
        }
      }
    end

    let(:instance) do
      StudentProfileResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { StudentProfile.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:student_profile) { create(:student_profile) }

    let(:payload) do
      {
        data: {
          id: student_profile.id.to_s,
          type: 'student_profiles',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      StudentProfileResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { student_profile.reload.updated_at }
      # .and change { student_profile.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:student_profile) { create(:student_profile) }

    let(:instance) do
      StudentProfileResource.find(id: student_profile.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { StudentProfile.count }.by(-1)
    end
  end
end

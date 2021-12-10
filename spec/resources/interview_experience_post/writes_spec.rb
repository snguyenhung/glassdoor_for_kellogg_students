require 'rails_helper'

RSpec.describe InterviewExperiencePostResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'interview_experience_posts',
          attributes: { }
        }
      }
    end

    let(:instance) do
      InterviewExperiencePostResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { InterviewExperiencePost.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:interview_experience_post) { create(:interview_experience_post) }

    let(:payload) do
      {
        data: {
          id: interview_experience_post.id.to_s,
          type: 'interview_experience_posts',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      InterviewExperiencePostResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { interview_experience_post.reload.updated_at }
      # .and change { interview_experience_post.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:interview_experience_post) { create(:interview_experience_post) }

    let(:instance) do
      InterviewExperiencePostResource.find(id: interview_experience_post.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { InterviewExperiencePost.count }.by(-1)
    end
  end
end

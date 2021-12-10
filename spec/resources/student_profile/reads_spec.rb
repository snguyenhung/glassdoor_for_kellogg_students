require 'rails_helper'

RSpec.describe StudentProfileResource, type: :resource do
  describe 'serialization' do
    let!(:student_profile) { create(:student_profile) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(student_profile.id)
      expect(data.jsonapi_type).to eq('student_profiles')
    end
  end

  describe 'filtering' do
    let!(:student_profile1) { create(:student_profile) }
    let!(:student_profile2) { create(:student_profile) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: student_profile2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([student_profile2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:student_profile1) { create(:student_profile) }
      let!(:student_profile2) { create(:student_profile) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            student_profile1.id,
            student_profile2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            student_profile2.id,
            student_profile1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

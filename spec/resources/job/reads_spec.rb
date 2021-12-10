require 'rails_helper'

RSpec.describe JobResource, type: :resource do
  describe 'serialization' do
    let!(:job) { create(:job) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(job.id)
      expect(data.jsonapi_type).to eq('jobs')
    end
  end

  describe 'filtering' do
    let!(:job1) { create(:job) }
    let!(:job2) { create(:job) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: job2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([job2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:job1) { create(:job) }
      let!(:job2) { create(:job) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            job1.id,
            job2.id
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
            job2.id,
            job1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

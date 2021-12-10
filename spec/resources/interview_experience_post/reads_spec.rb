require "rails_helper"

RSpec.describe InterviewExperiencePostResource, type: :resource do
  describe "serialization" do
    let!(:interview_experience_post) { create(:interview_experience_post) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(interview_experience_post.id)
      expect(data.jsonapi_type).to eq("interview_experience_posts")
    end
  end

  describe "filtering" do
    let!(:interview_experience_post1) { create(:interview_experience_post) }
    let!(:interview_experience_post2) { create(:interview_experience_post) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: interview_experience_post2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([interview_experience_post2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:interview_experience_post1) { create(:interview_experience_post) }
      let!(:interview_experience_post2) { create(:interview_experience_post) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      interview_experience_post1.id,
                                      interview_experience_post2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      interview_experience_post2.id,
                                      interview_experience_post1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end

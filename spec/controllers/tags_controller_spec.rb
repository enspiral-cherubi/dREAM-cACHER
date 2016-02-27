require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe "#from_dream" do
    before do
      @dream1 = create(:dream)
      @dream2 = create(:dream)
    end

    it "returns http status 200" do
      get :from_dream, { dream_id: @dream1.id }
      expect(response).to have_http_status(200)
    end

    it "returns all dreams with dreams_count > 1, as json" do
      tag1 = create(:tag)
      tag2 = create(:tag)
      @dream1.tags << [tag1, tag2]
      @dream2.tags << tag1
      get :from_dream, { dream_id: @dream1.id }

      expect(parsed(response).length).to eq(1)
      expect(parsed(response).first["word"]).to eq(tag1.word)
    end
  end
end

require 'rails_helper'

RSpec.describe TagsController, type: :controller do

  before do
    @dreams = []
    @user = create(:user)
    sign_in @user
    10.times do {
      dream = create( :dream, user_id: @user.id )
      @dreams.push(dream)
    }
    dreams.length.times do | i |
      create( :tag, dream_id: @dreams[i].id )
    end
  end

  describe '#dreams' do

    it { should respond_with(200) }

    it "will return all dreams with the presented tag, in the body of the last response, as json" do
      expect(response.body).to eq(dreams.to_json)
    end

    it "should assign @dreams to all dreams in the DB" do
      expect(assigns(:dreams)).to eq(Dreams.all)
    end
  end

end

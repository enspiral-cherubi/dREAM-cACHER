require 'rails_helper'

RSpec.describe DreamsController, type: :controller do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create(:user)
    sign_in @user
  end

  describe "#index" do
    before do
      10.times { create(:dream) }
      dreams = Dream.all
      get :index
    end

    it { should respond_with(200) }

    it "will contain all dreams in the body of the last response, as json" do
      expect(response.body).to eq(dreams.to_json)
    end

    it "should assign @dreams to all dreams in the DB" do
      expect(assigns(:dreams)).to eq(Dreams.all)
    end
  end



end

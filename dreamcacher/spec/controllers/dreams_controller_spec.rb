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
      @dreams = Dream.order(created_at: :desc)
      get :index
    end

    it { should respond_with(200) }

    it "will return all dreams in the db, in the body of the last response, as json" do
      expect(response.body).to eq(@dreams.to_json)
    end

    it "should assign @dreams to all dreams in the DB" do
      expect(assigns(:dreams)).to eq(@dreams)
    end
  end

  describe "#mine" do
    before do
      10.times { create(:dream, user_id: @user.id ) }
      @dreams = @user.dreams.order(created_at: :desc)
      get :mine, user_id: @user.id
    end

    it { should respond_with(200) }

    it "should return a user's dreams in last response body, as json" do
      expect(response.body).to eq(@dreams.to_json)
    end

    it "should assign the users dreams to @dreams" do
      expect(assigns(:dreams)).to eq(@dreams)
    end
  end



  describe "#create" do
    before do
      # @dream_params = attributes_for(:dream, user_id: @user.id)
      get :create, dream: 'asdf'
    end

    it { should respond_with(302) }

    it "creates a new dream with specified params" do
      expect(Dream.all.count).to eq(1)
    end

    it "creates a dream with the new dreams params, associated to the user" do
      dream = Dream.last
      expect(@user.dreams).to include(dream)
    end
  end

  describe '#from_tag' do
    before do
      10.times { create(:dream, user_id: @user.id ) }
      @tag = create(:tag)
      @dreams = Dream.order(created_at: :desc)
      @dreams.each do | dream |
        create(:theme, dream_id: dream.id, tag_id: @tag.id)
      end

      @dreams

      get :index, tag_word: @tag.word
    end

    it { should respond_with(200) }

    it "will return all dreams with a specified tag, in the body of the last response, as json" do
      expect(response.body).to eq(@dreams.to_json)
    end

    it "should assign @dreams to all dreams with the specified tag" do
      expect(assigns(:dreams)).to eq(@dreams)
    end
  end


  # describe "#show" do
  #   before do
  #       @dream = create(:dream)
  #       get :show, id: @dream.id
  #   end

  #   it { should respond_with(200) }

  #   it "should return specified dream in last response body, as json" do
  #     expect(response.body).to eq(@dream.to_json)
  #   end

  #   it "should assign specified dream to @dream" do
  #     expect(assigns(:dream)).to eq(@dream)
  #   end
  # end


end

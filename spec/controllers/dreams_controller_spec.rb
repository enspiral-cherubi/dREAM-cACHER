require 'rails_helper'

RSpec.describe DreamsController, type: :controller do
  describe "#index" do
    before do
      create_list(:dream, 4)
      get :index
    end

    it "returns http status 200" do
      expect(response).to have_http_status(200)
    end

    it "returns all dreams as json" do
      expect(parsed(response).length).to eq(4)
    end
  end

  describe "#mine" do
    context "user signed in" do
      before do
        @user = create(:user)
        request.headers.merge!(@user.create_new_auth_token)
        create_list(:dream, 2, user: @user)
        create_list(:dream, 1)
        get :mine
      end

      it "returns http status 200" do
        expect(response).to have_http_status(200)
      end

      it "returns current_user's dreams" do
        expect(parsed(response).length).to eq(2)
      end
    end

    context "user not signed in" do
      it "returns http status 401" do
        get :mine
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "#create" do
    context "valid params" do
      let(:valid_params) { { dream: "was thirsty" } }

      context "user signed in" do
        before do
          @user = create(:user)
          request.headers.merge!(@user.create_new_auth_token)
          post :create, valid_params
          @new_dream = Dream.find_by(user: @user, contents: valid_params[:dream])
        end

        it "returns http status 200" do
          expect(response).to have_http_status(200)
        end

        it "creates dream for current_user" do
          expect(@new_dream).to be_truthy
        end

        it "returns the newly created dream as json" do
          expect(parsed(response)["contents"]).to eq(@new_dream.contents)
        end

        it "creates themes for the dream" do
          expect(@new_dream.themes).not_to be_empty
        end

        it "assigns the dream a sentiment score" do
          expect(@new_dream.sentiment).to be_truthy
        end
      end

      context "user not signed in" do
        before do
          post :create, valid_params
          @new_dream = Dream.find_by(contents: valid_params[:dream])
        end

        it "creates dream for anonymous user" do
          expect(@new_dream.user.name).to eq("anonymous")
        end
      end
    end

    context "invalid params" do
      let(:invalid_params) { { dream: "" } }

      before do
        post :create, invalid_params
      end

      it "does not create a new dream" do
        expect(Dream.count).to eq(0)
      end

      it "returns http status 400" do
        expect(response).to have_http_status(400)
      end

      it "returns list of errors as json" do
        expect(parsed(response)["errors"]).not_to be_empty
      end
    end
  end

  describe '#from_tag' do
    before do
      @tag = create(:tag)
      @tag.dreams << create_list(:dream, 2)
      create_list(:dream, 3)
      get :from_tag, tag: @tag.word
    end

    it "returns http status 200" do
      expect(response).to have_http_status(200)
    end

    it "returns all dreams with specified tag, as json" do
      expect(parsed(response).length).to eq(2)
    end
  end
end

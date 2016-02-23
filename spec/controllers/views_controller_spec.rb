require 'rails_helper'

RSpec.describe ViewsController, type: :controller do
  let(:user) { create(:user) }
  let(:dream) { create(:dream) }

  describe "#index" do
    context "user signed in" do
      before do
        request.headers.merge!(user.create_new_auth_token)
        create_list(:view, 2)
        create_list(:view, 3, user: user)
        get :index
      end

      it "returns http status 200" do
        expect(response).to have_http_status(200)
      end

      it "returns all of current_user's views" do
        expect(parsed(response).length).to eq(3)
      end
    end

    context "user not signed in" do
      it "returns http status 401" do
        get :index
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "#create" do
    let(:valid_params) { {view: {dream_id: dream.id}} }
    let(:invalid_params) { {view: {dream_id: nil}} }

    context "user signed in" do
      before do
        request.headers.merge!(user.create_new_auth_token)
      end

      context "valid params" do
        before do
          post :create, valid_params
        end

        it "returns http status 200" do
          expect(response).to have_http_status(200)
        end

        it "creates a new view between the current_user and specified dream" do
          expect(View.find_by(user: user, dream: dream)).to be_truthy
        end
      end

      context "invalid params" do
        it "returns http status 400" do
          post :create, invalid_params
          expect(response).to have_http_status(400)
        end
      end
    end

    context "user not signed in" do
      it "returns http status 401" do
        post :create, valid_params
        expect(response).to have_http_status(401)
      end
    end
  end
end

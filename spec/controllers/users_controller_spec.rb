require 'rails_helper'

describe UsersController, :type => :controller do

  @user = FactoryGirl.create(:user)
  @user2 = FactoryGirl.create(:user)

  describe 'GET #show' do
    context 'User is logged in' do
      before do
        sign_in @user
      end
      it 'loads correct user details' do
				get :show, id: @user1.id
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq @user
			end
    end

    context 'No user is logged in' do
      it 'redirects to login' do
        get :show, id: @user.id
        expect(response).to redirect_to(user_session_path)
      end
    end

    context "user trys to login to another users show page"
      before do
        sign_in @user
      end
      it "redirects to root_path" do  
        get :show, id: @user2.id  
        expect(response.status).to eq 302  
        expect(response).to redirect_to(root_path)  
      end
    end
  end
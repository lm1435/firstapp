require 'rails_helper'

describe UsersController, :type => :controller do
  before do
    # @user=User.create!(first_name: 'exa', last_name: 'mple', email: 'exa@example.com', password: '1234321')
    #
    # @user1=User.create!(first_name: 'seco', last_name: 'nd',email: 'seco@second.com', password: '4321234')

    @user=FactoryGirl.create(:user)
  end

  describe 'GET #show' do
    context 'user is logged in' do
      before do
        sign_in @user
      end

      it 'loads correct user details' do
        get :show, id: @user.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end
    end

    context 'No user is logged in' do
      it 'redirects to login' do
        get :show, id: @user.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end

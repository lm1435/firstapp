require 'rails_helper'

describe UsersController, :type => :controller dos
	let(:user) {User.create!(first_name: 'exa', last_name: 'mple', email: 'exa@example.com', password: '1234321')}

	let(:user) {User.create!(first_name: 'seco', last_name: 'nd',email: 'seco@second.com', password: '4321234')}

	describe 'GET #show' do
		context 'user is logged in' do
			before do
				sign_in user
			end

			it 'loads correct user details' do
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq user
			end
		end

		context 'No user is logged in' do
			it 'redirects to login' do
				get :show, id: user.id
				expect(response).to redirect_to(root_path)
			end
		end
	end
end

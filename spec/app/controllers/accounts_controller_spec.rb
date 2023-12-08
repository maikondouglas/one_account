# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::AccountsController, type: :controller do
  let!(:account) { create(:account) }

  describe 'GET #index' do
    before { get :index }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of accounts' do
      expect(parsed_response).to be_an(Array)
      expect(parsed_response.first).to include(
        active: account.active,
        birthday: account.birthday.to_s,
        created_at: account.created_at.as_json,
        email: account.email,
        first_name: account.first_name,
        id: account.id,
        last_name: account.last_name,
        phone_number: account.phone_number,
        updated_at: account.updated_at.as_json
      )
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: account.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'creates an account' do
      account_params = attributes_for(:account)
      post :create, params: { account: account_params }
      expect(response).to have_http_status(:success)
      expect(Account::Record.count).to eq(2)
    end
  end

  describe 'PUT #update' do
    it 'updates an account' do
      put :update, params: { id: account.id, account: { first_name: 'NewName' } }
      account.reload
      expect(account.first_name).to eq('NewName')
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys an account' do
      delete :destroy, params: { id: account.id }
      expect(Account::Record.count).to eq(0)
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Accounts::Finder, type: :repository do
  subject(:account_repo) { Accounts::Repository.new }

  context 'when an account exists' do
    let(:account) { create(:account) } # Use FactoryBot ou sua fábrica de contas para criar uma conta válida.

    context 'with valid ID' do
      it 'returns the account' do
        result = account_repo.find(account.id)
        expect(result).to eq(account)
      end
    end

    context 'with invalid ID' do
      it 'raises an ActiveRecord::RecordNotFound error' do
        non_existing_id = 9999
        expect { account_repo.find(non_existing_id) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  context 'when multiple accounts exist' do
    let!(:accounts) { create_list(:account, 3) }

    it 'returns all accounts' do
      expect(account_repo.all).to match_array(accounts)
    end
  end
end

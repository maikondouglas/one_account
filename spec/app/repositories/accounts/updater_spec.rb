# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Accounts::Updater, type: :repository do
  subject(:account_repo) { Accounts::DelegateRepository.new }

  let(:updater)    { described_class.new }
  let(:account)    { create(:account) }
  let(:account_id) { account.id }
  let(:first_name) { 'New First Name' }
  let(:last_name)  { 'New Last Name' }
  let(:result)     { updater.update(params) }
  let(:updated_account) { account_repo.find(account_id) }

  let(:params) do
    { id: account_id, first_name:, last_name: }
  end

  context 'when the account exists' do
    it 'updates the account', aggregate_failures: true do
      result
      expect(updated_account.first_name).to eq(first_name)
      expect(updated_account.last_name).to eq(last_name)
    end
  end

  context 'when the account does not exist' do
    let(:account_id) { 9999 }

    it 'raises an ActiveRecord::RecordNotFound error' do
      expect { updater.update(params) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end

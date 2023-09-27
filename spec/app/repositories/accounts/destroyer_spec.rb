# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Accounts::Destroyer, type: :repository do
  let(:account)    { create(:account) }
  let(:destroyer)  { described_class.new }
  let(:account_id) { account.id }
  let(:result)     { destroyer.destroy(account_id) }

  describe '#destroy' do
    context 'when an account exists' do
      it 'destroys the account' do
        expect { result }.to change(Person::Account, :count).by(0)
      end
    end

    context 'when the account does not exist' do
      let(:account_id) { '999_999' }

      it 'does not raise an error' do
        expect { result }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end

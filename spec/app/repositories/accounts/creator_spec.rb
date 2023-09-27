# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Accounts::Creator, type: :repository do
  let(:creator) { described_class.new }
  let(:email)   { Faker::Internet.email }
  let(:params) do
    { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: }
  end
  let(:result) { creator.create(params) }

  describe '#create' do
    context 'when valid account_params' do
      it 'creates a new account' do
        expect { result }.to change(Person::Account, :count).by(1)
      end
    end

    context 'with invalid account_params' do
      let(:email) { nil }

      it 'does not create a new account' do
        expect { result }.to raise_error(ActiveRecord::NotNullViolation)
      end
    end
  end
end

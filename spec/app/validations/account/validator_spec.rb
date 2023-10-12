# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account::Validator, type: :validation do
  subject(:validator) { described_class.new }

  let(:first_name) { nil }
  let(:last_name)  { nil }
  let(:email)      { nil }

  before do
    validator.first_name = first_name
    validator.last_name  = last_name
    validator.email      = email
  end

  describe 'scenario success' do
    context 'when all attributes are present' do
      let(:first_name) { Faker::Name.first_name }
      let(:last_name)  { Faker::Name.last_name }
      let(:email)      { Faker::Internet.email }

      it 'returns valid' do
        expect(validator).to be_valid
      end
    end
  end

  describe 'scenario Failure' do
    context 'when first_name is missing' do
      let(:last_name) { Faker::Name.last_name }

      it 'returns invalid', aggregate_failures: true do
        expect(validator).not_to be_valid
        expect(validator.errors[:first_name]).to include("can't be blank")
      end
    end

    context 'when last_name is missing' do
      let(:first_name) { Faker::Name.first_name }

      it 'returns invalid', aggregate_failures: true do
        expect(validator).not_to be_valid
        expect(validator.errors[:last_name]).to include("can't be blank")
      end
    end

    context 'when email has an invalid format' do
      let(:email) { 'email.com' }

      it 'returns invalid', aggregate_failures: true do
        expect(validator).not_to be_valid
        expect(validator.errors[:email]).to include('O formato do email é inválido')
      end
    end
  end
end

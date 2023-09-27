# frozen_string_literal: true

Faker::Config.locale = 'pt-BR'

FactoryBot.define do
  factory :account, class: 'Person::Account' do
    first_name    { Faker::Name.first_name }
    last_name     { Faker::Name.last_name }
    email         { Faker::Internet.email }
    phone_number  { Faker::PhoneNumber.cell_phone }
    birthday      { Faker::Date.birthday }

    trait :active do
      active { true }
    end

    trait :inactive do
      active { false }
    end
  end
end

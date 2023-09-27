# frozen_string_literal: true

module Accounts
  class Creator
    def create(account_params)
      Person::Account.create(account_params)
    end
  end
end

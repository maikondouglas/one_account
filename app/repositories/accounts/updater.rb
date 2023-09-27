# frozen_string_literal: true

module Accounts
  class Updater
    def update(account_params)
      account = Person::Account.find(account_params[:id])
      account.update(account_params)
    end
  end
end

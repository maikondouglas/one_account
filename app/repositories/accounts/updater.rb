# frozen_string_literal: true

module Accounts
  class Updater < ::InitializeRepository
    def update(account_params)
      account = @repository.find(account_params[:id])
      account.update(account_params)
      account.reload
    end
  end
end

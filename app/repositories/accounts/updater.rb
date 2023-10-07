# frozen_string_literal: true

module Accounts
  class Updater
    def initialize(repository)
      @repository = repository
    end

    def update(account_params)
      account = @repository.find(account_params[:id])
      account.update(account_params)
    end
  end
end

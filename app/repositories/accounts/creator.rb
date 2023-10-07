# frozen_string_literal: true

module Accounts
  class Creator
    def initialize(repository)
      @repository = repository
    end

    def create(account_params) = @repository.create(account_params)
  end
end

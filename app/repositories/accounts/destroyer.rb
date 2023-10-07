# frozen_string_literal: true

module Accounts
  class Destroyer
    def initialize(repository)
      @repository = repository
    end

    def destroy(id)
      account = @repository.find(id)
      account.destroy
    end
  end
end

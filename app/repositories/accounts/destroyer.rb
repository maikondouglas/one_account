# frozen_string_literal: true

module Accounts
  class Destroyer < ::InitializeRepository
    def destroy(id)
      account = @repository.find(id)
      account.destroy
    end
  end
end

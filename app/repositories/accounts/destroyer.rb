# frozen_string_literal: true

module Accounts
  class Destroyer
    def destroy(id)
      account = Account::Record.find(id)
      account.destroy
    end
  end
end

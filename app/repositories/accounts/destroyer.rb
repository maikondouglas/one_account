# frozen_string_literal: true

module Accounts
  class Destroyer
    def destroy(id)
      account = Person::Account.find(id)
      account.destroy
    end
  end
end

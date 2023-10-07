# frozen_string_literal: true

module Accounts
  class Finder
    def find(id)
      Account::Record.find(id)
    end

    def all
      Account::Record.all
    end
  end
end

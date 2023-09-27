# frozen_string_literal: true

module Accounts
  class Finder
    def find(id)
      Person::Account.find(id)
    end

    def all
      Person::Account.all
    end
  end
end

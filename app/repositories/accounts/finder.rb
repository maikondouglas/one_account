# frozen_string_literal: true

module Accounts
  class Finder < ::InitializeRepository
    delegate :find, to: :repository
    delegate :all, to: :repository
  end
end

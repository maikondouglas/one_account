# frozen_string_literal: true

module Accounts
  class Creator < ::InitializeRepository
    delegate :create, to: :repository
  end
end

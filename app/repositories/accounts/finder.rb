# frozen_string_literal: true

module Accounts
  class Finder
    def initialize(repository)
      @repository = repository
    end

    def find(id) = @repository.find(id)
    def all      = @repository.all
  end
end

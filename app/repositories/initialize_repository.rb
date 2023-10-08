# frozen_string_literal: true

class InitializeRepository
  attr_accessor :repository

  def initialize(repository)
    @repository = repository
  end
end

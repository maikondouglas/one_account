# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InitializeRepository, type: :repository do
  describe '#initialize' do
    it 'creates an instance with the correct repository' do
      repository = instance_double('repository')
      initialize_repository = described_class.new(repository)

      expect(initialize_repository.repository).to eq(repository)
    end
  end
end

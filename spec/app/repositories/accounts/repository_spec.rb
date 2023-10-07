# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Accounts::Repository, type: :repository do
  let(:delegate_repository) { described_class.new }

  describe '#initialize' do
    it 'initializes the finder' do
      expect(delegate_repository.finder).to be_an_instance_of(Accounts::Finder)
    end

    it 'initializes the creator' do
      expect(delegate_repository.creator).to be_an_instance_of(Accounts::Creator)
    end

    it 'initializes the destroyer' do
      expect(delegate_repository.destroyer).to be_an_instance_of(Accounts::Destroyer)
    end

    it 'initializes the updater' do
      expect(delegate_repository.updater).to be_an_instance_of(Accounts::Updater)
    end
  end

  describe 'delegations' do
    it 'delegates #create to the creator' do
      allow(delegate_repository).to receive(:creator).and_return(instance_spy(Accounts::Creator))

      delegate_repository.create('params')

      expect(delegate_repository.creator).to have_received(:create).with('params')
    end

    it 'delegates #destroy to the destroyer' do
      allow(delegate_repository).to receive(:destroyer).and_return(instance_spy(Accounts::Destroyer))

      delegate_repository.destroy(1)

      # Use have_received to verify the delegation
      expect(delegate_repository.destroyer).to have_received(:destroy).with(1)
    end

    it 'delegates #update to the updater' do
      # Configure delegate_repository.updater as a spy
      allow(delegate_repository).to receive(:updater).and_return(instance_spy(Accounts::Updater))

      # Execute the method that triggers the delegation
      delegate_repository.update('params')

      # Use have_received to verify the delegation
      expect(delegate_repository.updater).to have_received(:update).with('params')
    end

    it 'delegates #find to the finder' do
      # Configure delegate_repository.finder as a spy
      allow(delegate_repository).to receive(:finder).and_return(instance_spy(Accounts::Finder))

      # Execute the method that triggers the delegation
      delegate_repository.find(1)

      # Use have_received to verify the delegation
      expect(delegate_repository.finder).to have_received(:find).with(1)
    end

    it 'delegates #all to the finder' do
      # Configure delegate_repository.finder as a spy
      allow(delegate_repository).to receive(:finder).and_return(instance_spy(Accounts::Finder))

      # Execute the method that triggers the delegation
      delegate_repository.all

      # Use have_received to verify the delegation
      expect(delegate_repository.finder).to have_received(:all)
    end
  end
end

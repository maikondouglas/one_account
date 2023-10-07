# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Accounts::Repository, type: :repository do
  let(:account_repo) { described_class.new }

  describe '#initialize' do
    it 'initializes the finder' do
      expect(account_repo.send(:finder)).to be_an_instance_of(Accounts::Finder)
    end

    it 'initializes the creator' do
      expect(account_repo.send(:creator)).to be_an_instance_of(Accounts::Creator)
    end

    it 'initializes the destroyer' do
      expect(account_repo.send(:destroyer)).to be_an_instance_of(Accounts::Destroyer)
    end

    it 'initializes the updater' do
      expect(account_repo.send(:updater)).to be_an_instance_of(Accounts::Updater)
    end
  end

  describe 'delegations' do
    context 'when delegates #create to the creator' do
      before do
        allow(account_repo).to receive(:creator).and_return(instance_spy(Accounts::Creator))
      end

      it do
        account_repo.create('params')
        expect(account_repo.send(:creator)).to have_received(:create).with('params')
      end
    end

    context 'when delegates #destroy to the destroyer' do
      before do
        allow(account_repo).to receive(:destroyer).and_return(instance_spy(Accounts::Destroyer))
      end

      it do
        account_repo.destroy(1)
        expect(account_repo.send(:destroyer)).to have_received(:destroy).with(1)
      end
    end

    context 'when delegates #update to the updater' do
      before do
        allow(account_repo).to receive(:updater).and_return(instance_spy(Accounts::Updater))
      end

      it do
        account_repo.update('params')
        expect(account_repo.send(:updater)).to have_received(:update).with('params')
      end
    end

    context 'when delegates #find to the finder' do
      before do
        allow(account_repo).to receive(:finder).and_return(instance_spy(Accounts::Finder))
      end

      it do
        account_repo.find(1)
        expect(account_repo.send(:finder)).to have_received(:find).with(1)
      end
    end

    context 'when delegates #all to the finder' do
      before do
        allow(account_repo).to receive(:finder).and_return(instance_spy(Accounts::Finder))
      end

      it do
        account_repo.all
        expect(account_repo.send(:finder)).to have_received(:all)
      end
    end
  end
end

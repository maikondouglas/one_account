# frozen_string_literal: true

# spec/models/base_spec.rb
require 'rails_helper'

module ModuleExample
  class Repository; end

  class DummyClass
    include Base

    repository 'Account::Record'
    repositories_names :repository

    delegate :all, to: :repository
  end
end

RSpec.describe Base, type: :repository do
  let(:dummy_instance) { ModuleExample::DummyClass.new }
  let(:repository_instance) { instance_double('RepositoryInstance') }

  describe 'create_repository_methods' do
    it 'return creation method repository' do
      expect(dummy_instance).to respond_to(:all)
    end
  end

  describe 'define_repository_method' do
    it 'return define method repository', :aggregate_failures do
      expect(dummy_instance.send(:define_repository_method, :repository)).to be_truthy
      expect(dummy_instance).to respond_to(:all)
    end
  end

  describe 'create_repository_instance' do
    context 'when create instance' do
      before do
        allow(dummy_instance).to receive(:repository_class).and_return(Class)
        allow(Class).to receive(:new).and_return(repository_instance)
      end

      it :aggregate_failures do
        expect(dummy_instance.send(:create_repository_instance, :repository)).to eq(repository_instance)
        expect(dummy_instance.instance_variable_get('@repository')).to eq(repository_instance)
      end
    end
  end

  describe 'repository_class' do
    it 'retorna a classe do repositório corretamente' do
      expect(dummy_instance.send(:repository_class, :repository)).to eq(ModuleExample::Repository)
    end
  end
end

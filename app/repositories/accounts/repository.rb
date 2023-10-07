# frozen_string_literal: true

module Accounts
  class Repository
    include ::Base

    repository 'Account::Record'
    repositories_names :finder, :creator, :destroyer, :updater

    delegate :create, to: :creator
    delegate :destroy, to: :destroyer
    delegate :update, to: :updater
    delegate :find, :all, to: :finder
  end
end

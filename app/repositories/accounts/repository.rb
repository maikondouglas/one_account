# frozen_string_literal: true

module Accounts
  class Repository
    attr_reader :finder, :creator, :destroyer, :updater

    def initialize
      @finder    = Finder.new
      @creator   = Creator.new
      @destroyer = Destroyer.new
      @updater   = Updater.new
    end

    delegate :create, to: :creator
    delegate :destroy, to: :destroyer
    delegate :update, to: :updater
    delegate :find, :all, to: :finder
  end
end

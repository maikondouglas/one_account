# frozen_string_literal: true

module Account
  class Record < ApplicationRecord
    self.table_name = 'accounts'
  end
end

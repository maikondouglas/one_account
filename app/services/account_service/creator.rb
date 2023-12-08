# frozen_string_literal: true

module AccountService
  class Creator
    class << self
      def create(params)
        validate_account! params
        account_repo.create(params)
      end

      private

        def validate_account!(params)
          validator = Account::Validator.new(params)
          raise StandardError.new(errors: validator.errors) unless validator.valid?
        end

        def account_repo
          @account_repo ||= Accounts::Repository.new
        end
    end
  end
end

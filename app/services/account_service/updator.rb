# frozen_string_literal: true

module AccountService
  class Updator
    class << self
      def update(params)
        validate_account! params
        account_repo.update(params)
      end

      private

        def validate_account!(params)
          validator = Account::Validator.new(attrs: params, scope: :update)
          raise StandardError.new(errors: validator.errors) unless validator.valid?
        end

        def account_repo
          @account_repo ||= Accounts::Repository.new
        end
    end
  end
end



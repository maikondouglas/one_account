# frozen_string_literal: true

module Account
  class Validator < Manager
    attr_reader :first_name, :last_name, :email, :phone_number, :birthday

    def initialize(attrs:, scope:)
      super(attrs, scope)
    end

    private

      validates :first_name, :last_name, :birthday, :phone_number, presence: true, if: -> { scope.eql?(:create) }
      validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'O formato do email é inválido' }, if: -> { scope.eql?(:create) }

      validate :unique_name_combination

      def unique_name_combination
        return unless first_name && last_name

        existing_record = account_repo.where(first_name:, last_name:).exists?
        errors.add(:base, 'Já existe uma conta com este nome') if existing_record
      end

      def account_repo
        @account_repo ||= Accounts::Repository.new
      end
  end
end

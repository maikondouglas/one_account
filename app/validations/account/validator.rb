# frozen_string_literal: true

module Account
  class Validator
    include ActiveModel::Model

    attr_accessor :first_name, :last_name, :email, :phone_number, :birthday

    validates :first_name, :last_name, :birthday, :phone_number, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'O formato do email é inválido' }

    validate :unique_name_combination
    validate :unique_birthday

    private

      def unique_name_combination
        return unless first_name && last_name

        existing_record = account_repo.where(first_name:, last_name:).exists?
        errors.add(:base, 'Já existe uma conta com este nome') if existing_record
      end

      def unique_birthday
        return unless birthday

        existing_record = account_repo.where(birthday:).exists?
        errors.add(:birthday, 'Já existe uma conta com esta data de aniversário') if existing_record
      end

      def account_repo
        @account_repo ||= Accounts::Repository.new
      end
  end
end

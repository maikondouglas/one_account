# frozen_string_literal: true

module Api
  module V1
    class AccountResourceSerializer < ActiveModel::Serializer
      include ActiveSupport::NumberHelper

      attributes :id, :name, :email, :phone_number, :birthday, :active

      def name
        return unless object.first_name? && object.last_name?

        "#{object.first_name} #{object.last_name}"
      end

      def email
        return unless object.email?

        object.email
      end

      def phone_number
        return unless object.phone_number?

        number_to_phone(object.phone_number, pattern: /(\d{1,3})(\d{5})(\d{4})$/, area_code: true)
      end

      def birthday
        return unless object.birthday?

        object.birthday.strftime('%d/%m/%Y')
      end
    end
  end
end

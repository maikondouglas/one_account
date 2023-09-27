# frozen_string_literal: true

module Account
  class Validator
    include ActiveModel::Model

    attr_accessor :first_name, :last_name, :email

    validates_presence_of :first_name, :last_name
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, message: 'O formato do email é inválido'
  end
end

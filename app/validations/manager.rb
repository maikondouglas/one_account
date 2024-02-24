# frozen_string_literal: true

class Manager
  include ActiveModel::Model

  attr_reader :scope

  def initialize(attrs = {}, scope = :create)
    check_attrs(attrs)
    @scope = scope
  end

  def check_attrs(attrs)
    attrs.each do |k, v|
      instance_variable_set("@#{k}", v) if self.class.method_defined?(k) || self.private_methods.include?(k.to_sym)
    end
  end
end

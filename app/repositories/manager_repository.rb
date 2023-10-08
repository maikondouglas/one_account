# frozen_string_literal: true

module ManagerRepository
  extend ActiveSupport::Concern

  included do
    class_attribute :_repository, instance_accessor: false
    class_attribute :_repositories_names, instance_accessor: false
  end

  def initialize
    create_repository_methods
  end

  private

    def create_repository_methods
      self.class._repositories_names.each { |repo_name| define_repository_method(repo_name) }
    end

    def define_repository_method(method_name)
      self.class.send(:define_method, method_name) do
        instance_variable_get("@#{method_name}") || create_repository_instance(method_name)
      end

      self.class.send(:private, method_name)
    end

    def create_repository_instance(method_name)
      instance_variable_set("@#{method_name}", repository_class(method_name).new(self.class._repository))
    end

    def repository_class(method_name)
      "#{self.class.module_parent}::#{method_name.capitalize}".constantize
    end

    class_methods do
      def repository(repository_class)
        self._repository = repository_class.constantize
      end

      def repositories_names(*names)
        self._repositories_names = names
      end
    end
end

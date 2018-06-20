require "simple_attrs/version"

module SimpleAttrs
  def self.included(base)
    base.extend ClassMethods

    base.class_eval do
      @simple_attrs ||= {}

      def initialize(options = {})
        options.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end

      def attributes
        self.class.simple_attrs.inject({}) do |result, attr_pair|
          key, _value = attr_pair
          result.merge(key => self.public_send(key))
        end
      end
    end
  end

  module ClassMethods
    def has_simple_attr(attr_name)
      @simple_attrs[attr_name.to_sym] = nil
      attr_accessor attr_name
    end

    def simple_attrs
      @simple_attrs
    end
  end
end

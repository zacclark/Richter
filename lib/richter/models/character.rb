require_relative 'trait'

module Richter
  module Models
    class Character
      attr_accessor :name, :appearance, :backstory, :notes

      def initialize(name)
        @name = name.to_s
        @traits = []
      end

      def traits
        @traits.clone
      end

      def add_trait(trait)
        raise ArgumentError, 'must be a trait' unless trait.is_a? Trait
        @traits << trait
      end

      def remove_trait(trait)
        @traits.delete(trait)
      end
    end
  end
end
module Richter
  module Models
    class Trait
      TERRIBLE = 'Terrible'
      POOR = 'Poor'
      ORDINARY = 'Ordinary'
      FAIR = 'Fair'
      GOOD = 'Good'
      GREAT = 'Great'
      INCREDIBLE = 'Incredible'
      PEERLESS = 'Peerless'

      attr_reader :ability, :mods

      def initialize(ability, mods)
        @ability = ability
        @mods = mods
      end

      def rank
        rank_mapping[@mods]
      end

      def mods=(modifier)
        if rank_mapping.keys.include? modifier
          @mods = modifier
        else
          raise ArgumentError, 'unknown modifier / rank'
        end
      end

      def rank=(rank)
        self.mods = rank_mapping.key(rank)
      end

      private

      def rank_mapping
        {
            -2 => TERRIBLE,
            -1 => POOR,
            00 => ORDINARY,
            01 => FAIR,
            02 => GOOD,
            03 => GREAT,
            04 => INCREDIBLE,
            05 => PEERLESS
        }
      end
    end
  end
end
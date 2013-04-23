require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'test_helper')
require File.join(File.expand_path(File.dirname(__FILE__)), '..', '..', '..', 'lib', 'richter', 'models', 'trait')

describe Richter::Models::Trait do
  describe '#initialize' do
    it 'takes the ability and the offset from ordinary' do
      reaction = Richter::Models::Trait.new("Reaction", 0)
      reaction.ability.must_equal "Reaction"
      reaction.rank.must_equal Richter::Models::Trait::ORDINARY
      reaction.mods.must_equal 0
    end
  end

  describe "#mods=" do
    before do
      @eyes_and_ears = Richter::Models::Trait.new("Eyes & Ears", 0)
    end

    it 'allows setting the modifier within the allowed range' do
      @eyes_and_ears.mods = -2
      @eyes_and_ears.rank.must_equal Richter::Models::Trait::TERRIBLE

      @eyes_and_ears.mods = -1
      @eyes_and_ears.rank.must_equal Richter::Models::Trait::POOR

      @eyes_and_ears.mods = 0
      @eyes_and_ears.rank.must_equal Richter::Models::Trait::ORDINARY

      @eyes_and_ears.mods = 1
      @eyes_and_ears.rank.must_equal Richter::Models::Trait::FAIR

      @eyes_and_ears.mods = 2
      @eyes_and_ears.rank.must_equal Richter::Models::Trait::GOOD

      @eyes_and_ears.mods = 3
      @eyes_and_ears.rank.must_equal Richter::Models::Trait::GREAT

      @eyes_and_ears.mods = 4
      @eyes_and_ears.rank.must_equal Richter::Models::Trait::INCREDIBLE

      @eyes_and_ears.mods = 5
      @eyes_and_ears.rank.must_equal Richter::Models::Trait::PEERLESS
    end

    it 'prevents setting out of bounds' do
      proc {
        @eyes_and_ears.mods = -3
      }.must_raise ArgumentError

      proc {
        @eyes_and_ears.mods = 6
      }.must_raise ArgumentError
    end
  end

  describe "#rank=" do
    before do
      @brawl = Richter::Models::Trait.new("Brawl", 0)
    end

    it 'allows setting the rank from the known list of ranks' do
      @brawl.rank = Richter::Models::Trait::TERRIBLE
      @brawl.mods.must_equal -2

      @brawl.rank = Richter::Models::Trait::POOR
      @brawl.mods.must_equal -1

      @brawl.rank = Richter::Models::Trait::ORDINARY
      @brawl.mods.must_equal 0

      @brawl.rank = Richter::Models::Trait::FAIR
      @brawl.mods.must_equal 1

      @brawl.rank = Richter::Models::Trait::GOOD
      @brawl.mods.must_equal 2

      @brawl.rank = Richter::Models::Trait::GREAT
      @brawl.mods.must_equal 3

      @brawl.rank = Richter::Models::Trait::INCREDIBLE
      @brawl.mods.must_equal 4

      @brawl.rank = Richter::Models::Trait::PEERLESS
      @brawl.mods.must_equal 5
    end

    it 'prevents setting out of bounds' do
      proc {
        @brawl.rank = -1
      }.must_raise ArgumentError

      proc {
        @brawl.rank = "other"
      }.must_raise ArgumentError
    end
  end
end
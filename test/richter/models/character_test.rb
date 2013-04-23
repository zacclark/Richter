require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'test_helper')
require File.join(File.expand_path(File.dirname(__FILE__)), '..', '..', '..', 'lib', 'richter', 'models', 'character')

describe Richter::Models::Character do
  describe '#initialize' do
    it 'takes the characters name' do
      john = Richter::Models::Character.new("Saint John")
      john.name.must_equal "Saint John"
    end

    it 'changes the name to a string' do
      nullman = Richter::Models::Character.new(nil)
      nullman.name.must_equal ''
    end
  end

  describe 'instance behavior' do
    before do
      @character = Richter::Models::Character.new('Test Man')
    end

    it 'allows setting and getting their name' do
      @character.name = 'Brother Timish'
      @character.name.must_equal 'Brother Timish'
    end

    it 'allows setting and getting their appearance' do
      @character.appearance = 'Tall and bald'
      @character.appearance.must_equal 'Tall and bald'
    end

    it 'allows setting and getting their backstory' do
      @character.backstory = 'Born, became monk'
      @character.backstory.must_equal 'Born, became monk'
    end

    it 'allows setting extra notes' do
      @character.notes = 'remember this'
      @character.notes.must_equal 'remember this'
    end

    describe 'traits' do
      describe "#traits" do
        it 'starts as an empty array' do
          @character.traits.must_equal []
        end

        it 'returns a copy' do
          @character.traits << "hey"
          @character.traits.must_equal []
        end

        it 'is not writable directly' do
          proc {
            @character.traits = ["hi"]
          }.must_raise NoMethodError
        end
      end

      describe "#add_trait" do
        it 'adds that trait to its list' do
          eyes_and_ears = Richter::Models::Trait.new("Eyes & Ears", 2)
          @character.add_trait(eyes_and_ears)
          @character.traits.must_equal [eyes_and_ears]
        end

        it 'does not accept non-trait input' do
          proc {
            @character.add_trait("stuff")
          }.must_raise ArgumentError
        end
      end

      describe "#remove_trait" do
        before do
          @eyes_and_ears = Richter::Models::Trait.new("Eyes & Ears", 2)
          @character.add_trait(@eyes_and_ears)
        end

        it 'removes the trait from the list' do
          @character.remove_trait(@eyes_and_ears)
          @character.traits.must_equal []
        end
      end
    end
  end
end
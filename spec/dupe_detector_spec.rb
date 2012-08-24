require 'spec_helper'

describe DupeDetector do
  context "initialized with strings" do
    describe "#dupes" do
      let(:dd_with_strings) { DupeDetector.new(%w{ s s p }) }
      it "returns duplicates" do
        dd_with_strings.dupes.should == %w{ s }
      end
    end
  end
  context "initialized with fixnums" do
    describe "#dupes" do
      let(:dd_with_fixnums) { DupeDetector.new([ 1, 2, 2, 3, 3, 4 ]) }
      it "returns duplicates" do
        dd_with_fixnums.dupes.should == [ 2, 3 ]
      end
    end
  end
  context "initialized with objects" do
    # LineItems initialized with id, desc, and position.
    let(:gum1)   { LineItem.new(1, 'gum1',   1) } 
    let(:stamp)  { LineItem.new(2, 'stamp',  2) }
    let(:dice)   { LineItem.new(3, 'dice',   2) }
    let(:cards)  { LineItem.new(4, 'cards',  3) }
    let(:file)   { LineItem.new(5, 'file',   3) }
    let(:button) { LineItem.new(6, 'button', 4) }
    let(:gum2)   { LineItem.new(1, 'gum2',   1) }
    context "with ids" do
      let(:dd_with_objects_with_ids) do
        objects = [ gum1, gum2, stamp]
        DupeDetector.new(objects)
      end
      describe "#dupes" do
        it "returns objects with duplicate ids" do
          dd_with_objects_with_ids.dupes(:id).should == [ gum1, gum2 ]
        end
      end
    end
    context "with positions" do
      let(:dd_with_more_objects_with_positions) do
        objects = [ gum1, stamp, dice, cards, file, button ]
        DupeDetector.new(objects)
      end
      it "returns objects with duplicate positions" do
        dd_with_more_objects_with_positions.dupes(:position).should == [ stamp, dice, cards, file ]
      end
    end
  end
end

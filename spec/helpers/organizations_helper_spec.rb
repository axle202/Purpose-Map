require_relative '../../spec/spec_helper' # Do not commit - ruby version difference
require 'ostruct'

describe OrganizationsHelper do
  before do
    @organization = OpenStruct.new(:latitude => 11, :longitude => 22)
    @others = [
      OpenStruct.new(:latitude => 33, :longitude => 44),
      OpenStruct.new(:latitude => 55, :longitude => 66)
      ]
    @organization.stub!(:nearbys).and_return(@others)
  end


  describe "The function pin" do
    it "should format a location as a lat and long separated by a comma" do
      helper.pin(@organization).should == "11,22"
    end
  end
  
  describe "The function pins" do
    it "should format a set of locations as in #pin, but with pipes separating the values" do
      helper.pins(@others).should == "33,44|55,66"
    end
  
    it "should accept more than two parameters" do
       helper.pins(@others << OpenStruct.new(:latitude => 9, :longitude => 13)).should == "33,44|55,66|9,13"
    end
  end
  
  describe "The function marker" do
    it "should prefix a set of locations with the word 'markers=color:some_color|'" do
       helper.marker('red', [@organization]).should == "markers=color:red|11,22"
       helper.marker('blue', @others).should == "markers=color:blue|33,44|55,66"
    end
  end
  
  describe "The function markers" do
    it "should join multiple calls to #marker by ampersands" do
      collection = [
        ['red', [@organization]],
        ['blue', @others]
      ]
      helper.markers(collection).should == "markers=color:red|11,22&markers=color:blue|33,44|55,66"
    end
  end
end

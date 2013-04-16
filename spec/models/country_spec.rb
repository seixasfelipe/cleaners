require 'spec_helper'

describe Country do

  subject(:country) { FactoryGirl.build(:country) }

  context "when initialized" do
    it "is a new Country" do
      expect(country).to be_a_new(Country)
    end

    it "is not a new String" do
      expect(country).not_to be_a_new(String)
    end

    it "should be valid with all filled field" do
      expect(country).to be_valid
    end
  end

  context "when receiving nil params" do
    it "as #name" do
      country.name= nil
      expect(country).not_to be_valid
      expect(country).to have(1).errors_on(:name)
    end

    it "as #abbreviation" do
      country.abbreviation= nil
      expect(country).to be_valid
      expect(country).to have(:no).errors_on(:abbreviation)
    end
  end

  context "when receiving valid params" do
    it "as 'value' #abbreviation" do
      country.abbreviation= 'value'
      expect(country).to be_valid
      expect(country).to have(:no).errors_on(:abbreviation)
    end
  end
end

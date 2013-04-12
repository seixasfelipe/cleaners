require 'spec_helper'

describe State do

  subject(:state) { FactoryGirl.build(:state) }

  context "when initialized" do
    it "is a new State" do
      expect(state).to be_a_new(State)
    end

    it "is not a new String" do
      expect(state).not_to be_a_new(String)
    end

    it "should be valid with all filled field" do
      expect(state).to be_valid
    end
  end

  context "when receiving nil params" do
    it "as #name" do
      state.name= nil
      expect(state).not_to be_valid
      expect(state).to have(1).errors_on(:name)
    end

    it "as #abbreviation" do
      state.abbreviation= nil
      expect(state).to be_valid
      expect(state).to have(:no).errors_on(:abbreviation)
    end

    it "as #country" do
      state.country= nil
      expect(state).not_to be_valid
      expect(state).to have(1).errors_on(:country)
    end
  end
end

require 'spec_helper'

describe Task do

  subject(:task) { FactoryGirl.build(:task) }

  context "when initialized" do
    it "is a new Task" do
      expect(task).to be_a_new(Task)
    end

    it "is not a new String" do
      expect(task).not_to be_a_new(String)
    end

    it "should be valid with all filled field" do
      expect(task).to be_valid
    end
  end

  context "when receiving nil params" do
    it "as #name" do
      task.name= nil
      expect(task).not_to be_valid
      expect(task).to have(1).errors_on(:name)
    end

    it "as #price" do
      task.price= nil
      expect(task).not_to be_valid
      expect(task).to have(1).errors_on(:price)
    end
  end
end

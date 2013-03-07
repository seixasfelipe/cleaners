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

    it "as #active" do
      task.active= nil
      expect(task).not_to be_valid
      expect(task).to have(1).errors_on(:active)
    end
  end

  context "when receiving valid params" do
    it "as false #active" do
      task.active= false
      expect(task).to be_valid
      expect(task).to have(:no).errors_on(:active)
    end
  end

  context "when deleting" do
    it "#active field should have true value" do
      expect(task.active).to be_true
      task.destroy
      expect(task.persisted?).to be_true
      expect(task.active).to be_false
    end

    it "should not update if #active field is false" do
      updated_at = task.updated_at
      task.active= false
      task.destroy
      expect(task.updated_at).to eq updated_at
      expect(task.active).to be_false
    end
  end
end

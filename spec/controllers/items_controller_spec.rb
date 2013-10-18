require 'spec_helper'

describe ItemsController do
	before :each do
    @item_completed = FactoryGirl.create :item_completed
    @incomplete_item = FactoryGirl.create :item_incomplete
  end

  context "Item creation" do
    before do
      @initial_count = Item.count
      post :create, item: FactoryGirl.attributes_for(:new_item)
    end

    it "expects the item count to be increased by one" do
      Item.count.should eql(@initial_count+1)
    end
	end

  context "Deleting an Item" do
    before :each do
      @item = FactoryGirl.create :new_item
      @initial_count = Item.count
      delete :destroy, id: @item.id
    end

    it "expects the items count to be decreased by one on successful deletion" do
      Item.count.should eql(@initial_count-1)
    end
  end

  context "Get all items" do

		it "should return a successful response" do
      response.should be_success
    end

    it "expects name as a key in JSON response" do
      expect(json.length).to eq(2)
    end
  end
end
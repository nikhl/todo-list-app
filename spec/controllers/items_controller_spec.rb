require 'spec_helper'

describe ItemsController do
	before :each do
    @item_completed = FactoryGirl.create :item_completed
    @incomplete_item = FactoryGirl.create :item_incomplete
  end

  context "Item creation" do
    before do
      @initial_count = Item.count
      post :create, item: FactoryGirl.attributes_for(:new_item), format: :json
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

  context "update an item" do
    before :each do
      @item_completed = FactoryGirl.create :item_completed
      put :update, id: @item_completed.id, item: {completed: false}, format: :json
    end

    it "correctly updates an item" do
      @item_completed.reload
      @item_completed.completed.should == false
    end
  end

  context "Get all items" do
    before :each do
      get :index, format: :json
    end

    it "provides matching packages details as JSON" do
      response.should be_success
      response.header['Content-Type'].should include 'application/json'
    end

    it "expects name as a key in JSON response" do
      JSON.parse(response.body).size.should eql(2)
    end
  end
end
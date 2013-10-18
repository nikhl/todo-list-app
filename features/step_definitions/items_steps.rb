Given /^I visit homepage$/ do
  visit "/"
end

Then /^I enter item name as '(.*?)'$/ do |name|
  page.find("#new_item_name").should be_true
  page.fill_in "name", with: name
  sleep 1
end

Then /^I click on Add$/ do
  page.find("#new_item_add").click
  sleep 1
end

Then /^I see the newly added item with name '(.*?)'$/ do |name|
  page.has_text?(name).should be_true
end

Given /^I click on delete icon of '(.*?)'$/ do |name|
	if page.has_css?("#items")
	  page.all("#items > div").each do |item|
	  	if item.has_content?(name)
	  		item.find('.delete_btn').click
	  		sleep 5
	  	end
	  end
	end
end

Then /^I should not find the item with name '(.*?)'$/ do |name|
	page.has_text?(name).should be_false
end

Given /^I clear all existing items$/ do
	if page.has_css?("#items")
		no_of_items = page.all("#items > div").length
		no_of_items.times do
			sleep 3
			page.first("#items > div").find('.delete_btn').click
	  end
	end
end

Then /^I check the checkbox of '(.*?)'$/ do |name|
	if page.has_css?("#items")
	  page.all("#items > div").each do |item|
	  	if item.has_content?(name)
	  		item.find('input').click
	  	end
	  end
	end
end

Then /^Item should be marked as complete$/ do
	page.first("#items > div").has_css?('.completed').should be_true
end

Then /^Item should be marked as incomplete$/ do
	page.first("#items > div").has_css?('.not_completed').should be_true
end

Then /^I uncheck the checkbox of '(.*?)'$/ do |name|
	if page.has_css?("#items")
	  page.all("#items > div").each do |item|
	  	if item.has_content?(name)
	  		item.find('input').click
	  	end
	  end
	end
end
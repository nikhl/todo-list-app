FactoryGirl.define do
	factory :item do
		factory :item_completed do
			name "Item One"
			completed true
		end

		factory :item_incomplete do
			name "Item Two"
			completed false
		end

		factory :new_item do
			name "Item New"
			completed false
		end
	end
end
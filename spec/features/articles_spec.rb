require "rails_helper"

describe "Articles", js: true do 

	it "should have title Articles" do
	  visit articles_path
	  expect(page).to have_content("Articles")
	end

end
require "rails_helper"

describe "New article", js: true do 

	it "should have have content new article added if article data is correct" do
	  visit new_article_path
	  fill_in "Title", with: "Title"
	  fill_in "Content", with: "Content"
	  click_button("Create Article")
	  expect(page).to have_content("New article added")
	end

	it "should have have error message if article data is correct" do
	  visit new_article_path
	  fill_in "Content", with: "Content"
	  click_button("Create Article")
	  expect(page).to have_content("None of article fields can be blank")
	end

	it "should have have error message if article data is correct" do
	  visit new_article_path
	  fill_in "Title", with: "Title"
	  click_button("Create Article")
	  expect(page).to have_content("None of article fields can be blank")
	end

end
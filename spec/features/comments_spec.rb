require "rails_helper"

describe "Comments" do

	before do
	  Article.create(title: "Title", content: "Content")
	  visit articles_path
	  click_on "Title"
	end

	describe "after creating" do
		it "should have notice of new comment if comment data is valid" do
		  fill_in "Content", with: "Content"
		  click_on "Create Comment"
          expect(page).to have_content("New comment has been just added")
		end
        
        it "should have error message if comment data is invalid" do
		  click_on "Create Comment"
          expect(page).to have_content("Comment can't be blank")
		end
	end

end
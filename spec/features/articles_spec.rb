require "rails_helper"

describe "Articles" do
	
    let!(:user) { FactoryGirl.create(:user) }
    
    context "" do

	  before do
        login user, "blogger"
	  end
  
      describe "action index"  do   
   
	    it "should have content create new article", js: true do
	      expect(page).to have_content("Create new article")
	    end
      end
  
      describe "action create" do
  
	    it "should have content new article added if article data is valid", js: true do
	    	within "#new_article" do
	        fill_in "Title", with: "Title"
	        fill_in "Content", with: "Content"
	      end
	      click_button("Create Article")
	      expect(page).to have_content("New article added")
	    end
    
	    it "should have have error message if article data is invalid", js: true do
	      within "#new_article" do
	        fill_in "Content", with: "Content"
	      end
	      click_button("Create Article")
	      expect(page).to have_content("None of article fields can be blank")
	    end
    
	    it "should have have error message if article data is invalid", js: true do
	    	within "#new_article" do
	        fill_in "Title", with: "Title"
	      end
	      click_button("Create Article")
	      expect(page).to have_content("None of article fields can be blank")
	    end
      end
    end

    
    context "" do
      
      let!(:user2) { FactoryGirl.create(:user, role: "admin", email: "admin@mail.com", password: "admin") }
	  let!(:article) { FactoryGirl.create(:article, user: user) }
      let!(:article2) { FactoryGirl.create(:article, title: "Zoo", content: "Content2", user: user2) }

      before do
      	login user, "blogger"
      end

      describe "action update" do

	    it "should have notice of updating if article data is valid", js: true do
	      within "#article_#{article.id}" do
	        click_link 'Edit'
	      end
	      fill_in "Title", with: "Title"
	      fill_in "Content", with: "Content"
	      click_button("Update Article")
	      expect(page).to have_content("Article #{article.title} has been just edited.")
	    end
    
	    it "should have have error message if article data is invalid", js: true do
	      within "#article_#{article.id}" do
	        click_on 'Edit'
	      end
		  fill_in "Title", with: ""
	      fill_in "Content", with: "Content"
	      click_button("Update Article")
	      expect(page).to have_content("None of article fields can be blank")
	    end
    
	    it "should have have error message if article data is invalid", js: true do
	      within "#article_#{article.id}" do
	        click_on 'Edit'
	      end
	      fill_in "Title", with: "Title"
	      fill_in "Content", with: ""
	      click_button("Update Article")
	      expect(page).to have_content("None of article fields can be blank")
	    end

	    it "should have form title if user have access to edit article" do
          within "#article_#{article.id}" do
	        click_on 'Edit'
	      end
	      expect(page).to have_content("Edit article")
	    end

	    it "should have not content edit if user does not have access" do
          within "#article_#{article2.id}" do
          	expect(page).to have_no_content("Edit")
	      end
	    end
	  end
      
      describe "action destroy" do

        it "should have notice of deleting article", js: true do
	      within "#article_#{article.id}" do
	        click_on 'Delete'
	      end
	      expect(page).to have_content("Article #{article.title} has been just deleted.")
	    end

	    it "should have notice of deleting article", js: true do
	      within "#article_#{article2.id}" do
	        expect(page).to have_no_content("Delete")
	      end
	    end
	  end
      
      describe "action show" do

	    it "should have all article attributes content", js: true do
	      within "#article_#{article.id}" do
	        click_on article.title
	      end
	      expect(page).to have_content(article.id)
	      expect(page).to have_content(article.title)
	      expect(page).to have_content(article.content)
	    end
	  end
      
      describe "#sort_by_field" do
  
        it "should have ascending order in id field", js: true do
          click_on 'Id'
          page_should_have_sequence article.title, article2.title
        end

        it "should have descending order in id field", js: true do
          click_on 'Id'
          click_on 'Id'
          page_should_have_sequence article2.title, article.title
        end
      end
    end

end
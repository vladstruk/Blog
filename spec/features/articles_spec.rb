require "rails_helper"

describe "Articles" do
	before do
      visit articles_path
	end

    describe "action index"  do   
 
	  it "should have title Articles", js: true do
	    expect(page).to have_content("Create new article")
	  end
    end

    describe "action create" do

	  it "should have content new article added if article data is valid", js: true do
	    fill_in "Title", with: "Title"
	    fill_in "Content", with: "Content"
	    click_button("Create Article")
	    expect(page).to have_content("New article added")
	  end
  
	  it "should have have error message if article data is invalid", js: true do
	    fill_in "Content", with: "Content"
	    click_button("Create Article")
	    expect(page).to have_content("None of article fields can be blank")
	  end
  
	  it "should have have error message if article data is invalid", js: true do
	    fill_in "Title", with: "Title"
	    click_button("Create Article")
	    expect(page).to have_content("None of article fields can be blank")
	  end
    end

    
    context "" do

	  let!(:article) { Article.create(title: "Title", content: "Content") }
      let!(:article2) { Article.create(title: "Title2", content: "Content2") }

      before do
        visit articles_path
	  end

      describe "action update" do

	    it "should have notice of updating if article data is valid", js: true do
	    	within "#article_#{article.id}" do
	    	  click_on 'Edit'
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
	      visit edit_article_path(article)
		  fill_in "Title", with: ""
	      fill_in "Content", with: "Content"
	      click_button("Update Article")
	      expect(page).to have_content("None of article fields can be blank")
	    end
    
	    it "should have have error message if article data is invalid", js: true do
	    	within "#article_#{article.id}" do
	    	  click_on 'Edit'
	    	end
	      visit edit_article_path(article)
	      fill_in "Title", with: "Title"
	      fill_in "Content", with: ""
	      click_button("Update Article")
	      expect(page).to have_content("None of article fields can be blank")
	    end
	  end
      
      describe "action destroy" do

        it "should have notice of deleting article", js: true do
	    	within "#article_#{article.id}" do
	    	  click_on 'Delete'
	    	end
	      expect(page).to have_content("Article #{article.title} has been just deleted.")
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
  
        it "should have ascending order in id field" do
        	click_on 'Id'
        	within "#article_#{article.id}" do
	    	 expect(page).to have_content(article.id)
	    	end
	    	within "#article_#{article2.id}" do
	    	 expect(page).to have_content(article2.id)
	    	end
        end

        it "should have descending order in id field" do
        	click_on 'Id'
        	click_on 'Id'
        	within "#article_#{article2.id}" do
	    	 expect(page).to have_content(article2.id)
	    	end
	    	within "#article_#{article.id}" do
	    	 expect(page).to have_content(article.id)
	    	end
        end
      end
    end


end
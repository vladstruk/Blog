require "rails_helper"

describe "Articles" do

    #index
	it "should have title Articles", js: true do
	  visit articles_path
	  expect(page).to have_content("Create new article")
	end

    #new
	it "should have content new article added if article data is valid", js: true do
	  visit new_article_path
	  fill_in "Title", with: "Title"
	  fill_in "Content", with: "Content"
	  click_button("Create Article")
	  expect(page).to have_content("New article added")
	end

	it "should have have error message if article data is invalid", js: true do
	  visit new_article_path
	  fill_in "Content", with: "Content"
	  click_button("Create Article")
	  expect(page).to have_content("None of article fields can be blank")
	end

	it "should have have error message if article data is invalid", js: true do
	  visit new_article_path
	  fill_in "Title", with: "Title"
	  click_button("Create Article")
	  expect(page).to have_content("None of article fields can be blank")
	end

    
    context "after editing" do

	  let!(:article) { Article.create(title: "Title", content: "Content") }
      let!(:article2) { Article.create(title: "Title2", content: "Content2") }

      #edit
	  it "should have notice of updating if article data is valid", js: true do
	  	visit articles_path
	  	within "#article_#{article.id}" do
	  	  click_on 'Edit'
	  	end
	    fill_in "Title", with: "Title"
	    fill_in "Content", with: "Content"
	    click_button("Update Article")
	    expect(page).to have_content("Article #{article.title} has been just edited.")
	  end
  
	  it "should have have error message if article data is invalid", js: true do
	  	visit articles_path
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
	  	visit articles_path
	  	within "#article_#{article.id}" do
	  	  click_on 'Edit'
	  	end
	    visit edit_article_path(article)
	    fill_in "Title", with: "Title"
	    fill_in "Content", with: ""
	    click_button("Update Article")
	    expect(page).to have_content("None of article fields can be blank")
	  end
      
      #delete
      it "should have notice of deleting article", js: true do
	  	visit articles_path
	  	within "#article_#{article.id}" do
	  	  click_on 'Delete'
	  	end
	    expect(page).to have_content("Article #{article.title} has been just deleted.")
	  end
    end

end
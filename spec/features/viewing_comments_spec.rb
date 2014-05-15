require 'spec_helper'

feature "Viewing comments" do
	let!(:post1) { FactoryGirl.create(:post) }
	let!(:comment1) { FactoryGirl.create(:comment, post: post1) }
	let!(:post2) { FactoryGirl.create(:post) }
	let!(:comment2) { FactoryGirl.create(:comment, post: post2) }

  scenario do
		visit posts_path
		click_link post1.title
		within(".comments") do
			expect(page).to have_content(comment1.author)
			expect(page).to_not have_content(comment2.author)
		end
  end
end

=begin
require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  pending "add some scenarios (or delete) #{__FILE__}"
end
=end

require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before (:each) do
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end
  
    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end
  
    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

## Add the following code but comment it out. We are working on getting this to work
#  context "Remove existing project" do
#    let!(:project) { Project.create(title: "Test title", description: "Test content") }
#    scenario "remove project" do
#      visit project_path('1')
#      click_link "Destroy this project"
#      expect(page).to have_content("Project was successfully destroyed")
#      expect(Project.count).to eq(0)
#    end
#  end
end
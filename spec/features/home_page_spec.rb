=begin 
require 'rails_helper'

RSpec.feature "HomePages", type: :feature do
  pending "add some scenarios (or delete) #{__FILE__}"
end
=end

require 'rails_helper'

RSpec.feature "Visiting the HomePage", type: :feature do
  scenario "The visitor should see projects" do
    visit root_path
    expect(page).to have_text("Projects")
  end
end

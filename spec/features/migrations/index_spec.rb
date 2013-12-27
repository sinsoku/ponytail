require 'spec_helper'

describe "/migrations" do
  it "title is 'Migrations'" do
    pending
    visit '/rails/migrations'
    expect(page).to have_title 'Migrations'
  end
end

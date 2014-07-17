require 'spec_helper'

describe "user can view urls.", slow: true do
  title = 'Ponytail'
  urls = [
    '/ponytail/migrations',
    '/ponytail/migrations/new',
    '/ponytail/schema',
    '/ponytail/schema/users',
  ]

  urls.each do |url|
    it "user can view #{url}" do
      visit url
      expect(page).to have_title title
    end
  end
end

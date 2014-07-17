require 'spec_helper'

feature 'user can browse pages' do
  scenario 'user can browse Migrations page' do
    visit ponytail_migrations_path
    expect(page).to have_content 'Migrations'
  end

  scenario 'user can browse new Migration page' do
    visit new_ponytail_migration_path
    expect(page).to have_content 'New Migration'
  end

  scenario 'user can browse Tables page' do
    visit ponytail_tables_path
    expect(page).to have_content 'Tables'
  end

  scenario 'user can select table, and browse users table page', js: true do
    pending 'Item do not selected from select_box'

    visit ponytail_tables_path
    select 'users', from: 'ponytail_table_name'

    expect(current_path).to eq ponytail_table_path :users
  end

  scenario 'user can browse users Table page' do
    visit ponytail_table_path :users
    expect(page).to have_content 'users'
  end
end

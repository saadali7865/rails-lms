# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    sequence(:email) { |n| "john.doe#{n}@example.com" }
    password { 'password123' }
    national_id {'32444-2222224-6'}
    profile_image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'profile.png'), 'image/png') }
  end
end
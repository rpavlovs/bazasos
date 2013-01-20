# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  login           :string(255)
#  family_name     :string(255)
#  given_name      :string(255)
#  middle_name     :string(255)
#  password_digest :string(255)
#  admin           :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :user do
    sequence(:login) { |n| "user-#{n}" }
    password 'password'
    given_name 'given'
    family_name 'family'
    middle_name 'middle'
    admin false

    trait :admin do
      admin true
    end
  end
end


FactoryBot.define do

  sequence :email do |n|
    "user-#{n}@company-#{n}.com"
  end

  sequence :name do |n|
    "name-#{n}"
  end

  ##
  ## factories
  ##

  factory :user do
    email    { generate(:email) }
    password { 'test1234' }
    confirmed_at { Time.now }
    # after :build do |doc|
    #   create( :profile, email: doc.email )
    # end
  end

end

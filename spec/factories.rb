FactoryGirl.define do 
  factory :user, :aliases => [:owner, :viewer] do 
    sequence(:email) { |n| "jack#{n}@tester.com" }
    sequence(:firstname) {|n| "jack the #{n}"}
    password "passw0rd"
  end
  
  factory :registry do
    sequence(:name) { |n| "Generic Registry #{n}" }
    owner
  end
  
end


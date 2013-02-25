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
  
  factory :attr_name, :aliases => [:attr] do
    sequence(:description) { |n| "Attribute Number #{n}" }
    value_type "STRING"

    factory :linkable_attr do
      link "1"
    end
  end
  
end


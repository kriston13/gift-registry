FactoryGirl.define do 
  factory :user, :aliases => [:owner, :viewer] do 
    sequence(:email) { |n| "jack#{n}@tester.com" }
    sequence(:firstname) {|n| "Jack the #{n}"}
    password "passw0rd"
  end
  
  factory :registry do
    sequence(:name) { |n| "Generic Registry #{n}" }
    owner
  end
  
  factory :registry_item do
    sequence(:name) { |n| "Item #{n}" }
    description "Some description for this item"
    registry
  end
  
  factory :item_attr_val do
    registry_item
    attr_name
    raw_value "A String"
  end
  
  
  factory :attr_name, :aliases => [:attr] do
    sequence(:description) { |n| "Attribute Number #{n}" }
    value_type "STRING"
    
    factory :linkable_attr do
      link "1"
    end
    
    factory :price_attr do
      description "A Price Attribute"
      value_type "INTEGER"
      treat_as_price true
    end
    
    factory :low_price do
      description "Range Low Price"
      value_type "INTEGER"
      treat_as_price true
    end
    
    factory :high_price do
      description "Range High Price"
      value_type "INTEGER"
      treat_as_price true
    end
    
  end
  
  factory :booking do
  
  end
  
end


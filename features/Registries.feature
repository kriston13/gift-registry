Feature: Users can create registries
In order to share what they want
Users should create registries
And populate them with registry items


    Scenario: A User can create a registry
        Given "Ping" signs up
        When I create a registry named "My First Registry"
        Then I see a "title" of "My First Registry"
        And I see a "h2" of "My First Registry"
        And I see "Add an item to this registry"
        
    Scenario: A user adds a new item to their registry
        Given "Ping" signs up
        Given I create a registry named "My First Registry"
        When I add an item to the registry
        Then I see a "h2" of "My First Registry"
        And I see a "li" of "a present"
        And I see a "li" of "$10"
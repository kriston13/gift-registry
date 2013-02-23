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
        
Feature: Users can signup and login
In order to interact with registries
A User
Should signup

    Scenario: A User signs up
        When "Ping" signs up
        Then I see "Logout"
        And I see "Ping"
        
    Scenario: A User does not have matched passwords
        When "Pong" signs up without matched passwords
        Then I see "Password doesn't match confirmation"
        
    Scenario: A User does not include their first name
        When "Pock" signs up without a first name
        Then I see "Firstname can't be blank"
        
    Scenario: A User signs up with an existing email
        Given "Ping" signs up
        When "Plock" signs up with the same email
        Then I see "Email has already been taken"
    
    Scenario: A newly registered User can log out
        Given "Pom" signs up
        And I logout
        Then I see "You've been logged out"
    
    Scenario: A User logs in
        Given "Ping" signs up
        And I logout
        When I login with "Ping"
        Then I see "You're now logged in"
        
    
    
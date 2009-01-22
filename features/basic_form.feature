Feature: Generating a basic form
  In order to save time
  As a developer
  I want to have my forms generated for my models
  
  Scenario: Auto-Generating for a new record
    Given a model for 'people' with name:string
    When I generate a form for a new instance
    Then a form is generated
    And the form 'action' attribute is '/people'
    And the form 'method' attribute is 'post'
    And the form has a 'text field' for 'name'
    And the form has a submit button
    
  

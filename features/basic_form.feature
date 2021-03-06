Feature: Generating a basic form
  In order to save time
  As a developer
  I want to have my forms generated for my models
  
  Scenario: Auto-Generating for a new record
    Given a model for 'people' with name:string
    When I generate a form for a new Person
    Then a form is generated
    And the form 'action' attribute is '/people'
    And the form 'method' attribute is 'post'
    And the form has 1 'text field' for 'person[name]'
    And the form has a submit button
    
  Scenario: Auto-Generating for an existing record
    Given a model for 'people' with name:string age:string
    And I save a Person with name Pat and age 22
    When I generate a form for the first Person
    Then a form is generated
    And the form 'action' attribute is '/people/1'
    And the form 'method' attribute is 'post'
    And the form has 1 'text field' for 'person[name]' with value 'Pat'
    And the form has 1 'text field' for 'person[age]' with value '22'
    And the form has 1 'hidden field' for '_method' with value 'put'
    And the form has a submit button

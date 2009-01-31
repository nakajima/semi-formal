Feature: Generating proper field types for attributes
  In order to generate a more usable form
  As a developer
  I want to generate forms with the proper field types
  
  Scenario: Generating a form with a text field
    Given a model for 'people' with name:string
    When I generate a form for a new instance
    Then the form has 1 'text field' for 'person[name]'
  
  Scenario: Generating a form with a text field
    Given a model for 'people' with about:text
    When I generate a form for a new instance
    Then the form has 1 'text area' for 'person[about]'

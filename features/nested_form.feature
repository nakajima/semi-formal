Feature: Generating forms for nested resources
  In order to generate a form for nested resource
  As a developer
  I want to generate forms for child resources
  
  Scenario: When a record is a child model
    Given a model for 'articles' with title:string
    And I save a Article with title Test
    And a model for 'comments' with article_id:integer name:string    
    And Comment belongs to Article
    And I save a Comment with article_id 1
    When I generate a form for the first Comment with parent article
    Then a form is generated
    And the form 'action' attribute is '/articles/1/comments/1'
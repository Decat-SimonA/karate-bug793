Feature: Test Javascript function

  Background:
    * def baseFunction =
    """
      function(value) {
        return "Hello " + value;
      }
    """
    * def arrayWrappedFunction =
    """
      [function(value) {
        return "Hello " + value;
      }]
    """
    * def callWrappedFunction =
    """
      function(value) {
        return arrayWrappedFunction[0](value);
      }
    """

  Scenario: Hello world

    Given def arg = "World"
    And def return = call callWrappedFunction arg
    Then match return == "Hello World"

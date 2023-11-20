#@Sanity
Feature: Help

  # @Sanity
  Scenario: Navigate help and search
    When Click Help link
    When Enter search data
    When Click search button
    Then Verify search result


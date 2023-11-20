@Regression
Feature: Teams

   @Sanity
  Scenario: Create Team

    Given Navigate to page "/security/teams"
    Given Teams Page is displayed
    When Click Add button
    When Enter Team Details
    When Click Create button
    Then Verify Team is created

   @Sanity
  Scenario: Link Team member to Existing Team
    Given Verify execution of below scenarios is successful
      | Create Team |
    When Click on Created Team
    Then Edit Team Page is Displayed
    When Click on Link people button
    Then Change Relationships Page is Displayed
    When Select User
    When Click on Save Relationship button
    Then Verify User is Linked

   @Sanity
  Scenario: UnLink Team member from Existing Team
    Given Verify execution of below scenarios is successful
      | Link Team member to Existing Team |
    Given Teams Page is displayed
    When Click on Created Team
    Then Edit Team Page is Displayed
    When At least one user is linked to the team
    When Click on Link people button
    Then Change Relationships Page is Displayed
    When User is unselected
    When Click on Save Relationship button
    Then Verify User is Unlinked

   @Sanity
  Scenario: Delete Team
    Given Verify execution of below scenarios is successful
      | Create Team |
    Given Navigate to page "/security/teams"
    Given Teams Page is displayed
    When Team is present
    Then Team is selected
    When Click Delete icon
    Then Delete confirmation dialogue is displayed
    When Clicked on Confirm button
    Then Verify Team is deleted


  Scenario: Clone Team
    Given Verify execution of below scenarios is successful
      | Create Team |
    Given Navigate to page "/security/teams"
    Given Teams Page is displayed
    When SOC Team is present
    Then Click on SOC Team
    When Edit SOC Team Page is Displayed
    Then Save Assigned Team members details
    When Click Cancel button on Edit Team form
    When SOC Team is present
    When Click Teams grid checkbox
    When Click "Clone" button
    Then Confirmation popup appears
    When Click "Confirm" button
    Then Verify toaster message appears
    |1 record(s) cloned|
    Then Verify Cloned Team is present
    When Click on Cloned SOC Team
    Then Verify Assigned Team members details
    When Click Cancel button on Edit Team form


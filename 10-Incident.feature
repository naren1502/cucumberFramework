@Regression
Feature: Incident

   @Sanity
  Scenario: Clone a record without related records
    When Navigate to page "/modules/incidents"
    Then Incident Page is displayed
    Given New Incident is created
    When Select Incident Checkbox
    Then Clone button is displayed
    When Click Clone button
    Then Confirmation popup appears
    Then Verify Include Relationship checkbox is displayed
    Then Verify Include Relationships checkbox is unchecked
    When Click Confirm
    Then Verify Incident is cloned

   @Sanity
  Scenario: User links incident to an Alert and audit log shows the update
    Given Verify execution of below scenarios is successful
      | Clone a record without related records                |
      | Create alert record with required and optional fields |
    Given Correlations tab is displayed
    When Click Correlations
    Then Click Alerts Tab
    When Click on Add Alert
    Then Alert form is displayed
    Then Add link alert details
    When Click Alert Create Button
    Then Verify count of Alerts in the tab
    Then Verify Alert is present in the grid
    Then Verify newly linked Alert Name on opened Alert page
    Then Verify breadcrum on opened Alert page
    When Click Correlations
    Then Click Incidents Tab
    Then Verify Alert Relationship tab for linked Incident

   @Sanity
  Scenario: Clone a record with related records
    Given Verify execution of below scenarios is successful
      | User links incident to an Alert and audit log shows the update |
    Given Navigate to page "/modules/incidents"
    Then Incident Page is displayed
    When Select Incident Checkbox
    Then Clone button is displayed
    When Click Clone button
    Then Confirmation popup appears
    Then Verify Include Relationship checkbox is displayed
    When Select Include Relationship checkbox
    Then Verify Include Relationships checkbox is checked
    When Click Confirm
    Then Verify Incident is cloned with Related Record
    When Correlations tab is displayed
    When Click Correlations
    Then Click Alerts Tab
    Then Verify Alert is present in the grid


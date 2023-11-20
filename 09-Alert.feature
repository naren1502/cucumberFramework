@Regression
Feature: Alert

   @Sanity
  Scenario: Create alert record with required and optional fields
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click on Add Alert
    Then Alert creation form is displayed
    Then Add alert details
    When Click on Save Button
    Then Verify Alert Detail View is displayed
    Then Close Record Detail View
    Then Verify alert is created
    Then Store alert id of the alert

   @Sanity
	Scenario: Clone alert record
    Given Verify execution of below scenarios is successful
      | Create alert record with required and optional fields |
	Given Newly created Alert is open
	When Close Record Detail View
	Then Alert Grid is displayed
	When Select alert checkbox
	
	Then Clone alert button is displayed
    When Click clone alert  button
    Then Confirmation popup appears
    Then Verify Include Relationship checkbox is displayed
    Then Verify Include Relationships checkbox is unchecked
    When Click Confirm
    
    Then Verify clone record toaster message appears
    When Enter alert name in search textbox
    Then Verify more than one alert records are present
    When Open cloned alert record
    Then Store alert id of cloned alert
    Then Verify source id of cloned report
	
   @Sanity
  Scenario: Delete a record
    Given Verify execution of below scenarios is successful
      | Clone alert record |
    Given Verify record "New_Alert_TIME_STAMP (1)" opens
    When Click on Delete button
    Then Delete confirmation dialogue is displayed
    When Clicked on Confirm button
    Then Alert Grid is displayed
    Then Alert is deleted from the grid    

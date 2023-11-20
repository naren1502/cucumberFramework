@Regression
Feature: Appliances

		 @Sanity
    Scenario: Create New Appliance
    When Click Setting Button
    Then Verify System configuration page is displayed
    When Click on Apppliances
    Then Verify Appliances page is displayed
    When Click on Add Appliance button
    Then Verify New Appliance Form is displayed
    When Enter Appliance Details
    When Click Save button
    Then Verify Public and Private keys are displayed
    When Click Ok button
    Then Verify User is Navigated to Appliance Grid View
    Then Verify Appliance is added

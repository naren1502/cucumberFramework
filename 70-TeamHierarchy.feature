@Regression
Feature: Team Hierarchy


  Scenario: Verify Team Hierarchy for Parent and Child
    Given Verify execution of below scenarios is successful
      | Run Import Template |
    Then Click Setting Button
	#Set parent user status to Active
    Then Navigate to Users page
    When Select user "Tendulkar"
    Then Verify Edit User page is displayed
    Then Verify "Status" dropdown value is "Inactive"
    When "Status" Filter is Set to "Active"
    When Click On Reset Password
    When Click New Password
    When Click Confirm Password
    When Click Submit button
    Then Verify toaster message appears
      | Password changed successfully. |
    When Click "Save" button
    Then Verify toaster message appears
      | Sachin Tendulkar saved. |
		#Navigate to Indicator
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
		#Add Indicator with csadmin user
    When Click Add record button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page header | Indicators     | span |
    Then Enter "csadmin@fortisoar.com" in field "Value"
    When Click " Save" button
    Then Verify toaster message appears
      | You have created "csadmin@fortisoar.com". |
    When Close Record Detail View
    Then Verify User Navigated to Indicators
    Then Navigate to page "/logout"
		#Login with parent user
    Given Login page is displayed
    When Login to FortiSOAR
      | Username | Password  |
      | sachin   | Demo@1234 |
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
		#Verify Indicator created by csadmin is visible to parent user
    When Filter grid column "Value" by entering "csadmin@fortisoar.com" in column level search box filter
    And Verify correct record is fetched
      | ColumnName | Value                 |
      | Value      | csadmin@fortisoar.com |
	  	#Add Indicator with parent user
    When Click Add record button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page header | Indicators     | span |
    Then Enter "sachin@fortisoar.com" in field "Value"
    When Click " Save" button
    Then Verify toaster message appears
      | You have created "sachin@fortisoar.com". |
    When Close Record Detail View
    Then Verify User Navigated to Indicators
    Then Navigate to page "/logout"
		#Login with csadmin
    Given Login page is displayed
    Given Login to FortiSOAR
      | Username | Password     |
      | csadmin  | UserPassword |
		#Verify Indicator created by parent user is not visible for csadmin
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
    When Filter grid column "Value" by entering "sachin@fortisoar.com" in column level search box filter
    Then Verify grid record count is "0"


  Scenario: Verify Team Hierarchy for Siblings
    Given Verify execution of below scenarios is successful
      | Run Import Template |
		#Set Siblings user status to Active
    Then Navigate to page "/security/people"
    When Select user "Dravid"
    Then Verify Edit User page is displayed
    Then Verify "Status" dropdown value is "Inactive"
    When "Status" Filter is Set to "Active"
    When Click On Reset Password
    When Click New Password
    When Click Confirm Password
    When Click Submit button
    Then Verify toaster message appears
      | Password changed successfully. |
    When Click "Save" button
    Then Verify toaster message appears
      | Rahul Dravid saved. |
    Then Navigate to page "/logout"
		#Login with sibling user - rahul
    Given Login page is displayed
    When Login to FortiSOAR
      | Username | Password  |
      | rahul    | Demo@1234 |
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
		#Add Indicator with rahul user
    When Click Add record button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page header | Indicators     | span |
    Then Enter "rahul@fortisoar.com" in field "Value"
    When Click " Save" button
    Then Verify toaster message appears
      | You have created "rahul@fortisoar.com". |
    When Close Record Detail View
    Then Verify User Navigated to Indicators
    Then Navigate to page "/logout"
		#Login with sibling user - msd
    Given Login page is displayed
    When Login to FortiSOAR
      | Username | Password  |
      | msd      | Demo@1234 |
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
		#Verify Indicator created by sibling-rahul is visible to msd user
    When Filter grid column "Value" by entering "rahul@fortisoar.com" in column level search box filter
    And Verify correct record is fetched
      | ColumnName | Value               |
      | Value      | rahul@fortisoar.com |
		#Add Indicator with msd user
    When Click Add record button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page header | Indicators     | span |
    Then Enter "msd@fortisoar.com" in field "Value"
    When Click " Save" button
    Then Verify toaster message appears
      | You have created "msd@fortisoar.com". |
    When Close Record Detail View
    Then Verify User Navigated to Indicators
    Then Navigate to page "/logout"
		#Login with sibling user - rahul
    Given Login page is displayed
    When Login to FortiSOAR
      | Username | Password  |
      | rahul    | Demo@1234 |
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
		#Verify Indicator created by sibling-rahul is visible to msd user
    When Filter grid column "Value" by entering "msd@fortisoar.com" in column level search box filter
    And Verify correct record is fetched
      | ColumnName | Value             |
      | Value      | msd@fortisoar.com |
    Then Verify User Navigated to Indicators


  Scenario: Verify Team Hierarchy for SOC Team and Child
    Given Verify execution of below scenarios is successful
      | Run Import Template |
		#Login with csadmin & Active child team user - virat
    Given Navigate to page "/logout"
    Given Login page is displayed
    Given Login to FortiSOAR
      | Username | Password     |
      | csadmin  | UserPassword |
    Then Click Setting Button
    Then Navigate to Users page
    When Select user "Kohli"
    Then Verify Edit User page is displayed
    Then Verify "Status" dropdown value is "Inactive"
    When "Status" Filter is Set to "Active"
    When Click On Reset Password
    When Click New Password
    When Click Confirm Password
    When Click Submit button
    Then Verify toaster message appears
      | Password changed successfully. |
    When Click "Save" button
    Then Verify toaster message appears
      | Virat Kohli saved. |
    Then Navigate to page "/logout"
		#Login with child user - virat
    Given Login page is displayed

    Given Login to FortiSOAR
      | Username | Password  |
      | virat    | Demo@1234 |
		#Navigate to Indicator
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
		#Create Indicator with child team user - virat
    When Click Add record button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page header | Indicators     | span |
    Then Enter "virat@fortisoar.com" in field "Value"

    When Click " Save" button
    Then Verify toaster message appears
      | You have created "virat@fortisoar.com". |
    When Close Record Detail View
    Then Verify User Navigated to Indicators
		#Verify Indicator created by SOC Team user - rahul is not visible to child team user - virat
    When Filter grid column "Value" by entering "rahul@fortisoar.com" in column level search box filter
    Then Verify grid record count is "0"
    Then Navigate to page "/logout"
		#Login with SOC Team user - rahul
    Given Login page is displayed

    When Login to FortiSOAR
      | Username | Password  |
      | rahul    | Demo@1234 |
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
		#Verify Indicator created by child team user - virat is visible to SOC team user - rahul
    When Filter grid column "Value" by entering "virat@fortisoar.com" in column level search box filter
    And Verify correct record is fetched
      | ColumnName | Value               |
      | Value      | virat@fortisoar.com |


  Scenario: Verify Team Hierarchy for Parent and Grand Child
		#Login with Parent Team user - sachin
    Given Verify execution of below scenarios is successful
      | Run Import Template |
    Given Navigate to page "/logout"
    Given Login page is displayed

    When Login to FortiSOAR
      | Username | Password  |
      | sachin   | Demo@1234 |
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
		#Verify Indicator created by grand child team user - virat is visible to parent team user - sachin
    When Filter grid column "Value" by entering "virat@fortisoar.com" in column level search box filter
    And Verify correct record is fetched
      | ColumnName | Value               |
      | Value      | virat@fortisoar.com |
    Then Navigate to page "/logout"
	  	#Login with grand child user - virat
    Given Login page is displayed

    Given Login to FortiSOAR
      | Username | Password  |
      | virat    | Demo@1234 |
		#Navigate to Indicator
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
		#Verify Indicator created by Paren Team user - sachin is not visible to grand child team user - virat
    When Filter grid column "Value" by entering "sachin@fortisoar.com" in column level search box filter
    Then Verify grid record count is "0"


  Scenario: Verify Team Hierarchy for SOC Team Parent and SOC Team Sibling
    Given Verify execution of below scenarios is successful
      | Run Import Template |
    Given Navigate to page "/logout"
		#Login with Parent Team user - sachin
    Given Login page is displayed

    When Login to FortiSOAR
      | Username | Password  |
      | sachin   | Demo@1234 |
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
		#Verify Indicator created by SOC team sibling user - msd is not visible to parent team user - sachin
    When Filter grid column "Value" by entering "msd@fortisoar.com" in column level search box filter
    Then Verify grid record count is "0"
    Then Navigate to page "/logout"
		#Login with SOC Team sibling user - msd
    Given Login page is displayed

    When Login to FortiSOAR
      | Username | Password  |
      | msd      | Demo@1234 |
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
		#Verify Indicator created by SOC team parent user - sachin is not visible to SOC team sibling user - msd
    When Filter grid column "Value" by entering "sachin@fortisoar.com" in column level search box filter
    Then Verify grid record count is "0"


  Scenario: Verify Team Hierarchy
    Given Verify execution of below scenarios is successful
      | Run Import Template |
    Given Navigate to page "/logout"
	    # Login with csadmin
    Given Login page is displayed

    When Login to FortiSOAR
      | Username | Password     |
      | csadmin  | UserPassword |
		# Verify Team hierarchy
    When Navigate to page "/security/team-hierarchy"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page header | Team Hierarchy | h1  |
    When Double click SOC Team
    Then Verify SOC Team is selected for editing
    Then Verify Parent Team is set as parent of SOC Team
    Then Verify Sibling Team is set as sibling of SOC Team
    Then Verify Child Team is set as child of SOC Team

@Regression
Feature: Audit Logs

 @Sanity
Scenario: Logs Generation in Audit Log
	Given Verify execution of below scenarios is successful
	|Create alert record with required and optional fields|
	When Click Setting Button
	Then System configuration page is displayed
	When Click Audit Log
	Then Audit Log is displayed
	Then Verify Title displayed
	Then Verify Record Type displayed
	Then Verify Operation displayed
	Then Verify User displayed
	Then Verify Source displayed
	Then Verify Transaction Date displayed
	When Select Alerts as Record Type
	Then Verify Alerts Logs displayed
	Then Clear Record type dropdown option
	When Select csadmin as User
	Then Verify csadmin user logs displayed
	Then Clear User dropdown option
	When Select Create Operation
	Then Verify Create Logs displayed
	Then Clear Create Operation dropdown option
	When Select From Date and To Date
	Then Verify Logs displayed in given Range
	When click to Expand Logs Row
	Then Verify Logs get Expanded
	When Search for Log
	Then Verify searched log get displayed

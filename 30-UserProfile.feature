@Regression
Feature: User Profile


Scenario: Edit user profile and verify the changes
	When User Profile button is displayed
	When Click User Profile button
	Then Verify Edit Profile option is displayed
	When Click Edit Profile option
	Then Verify Edit User page is displayed
	When Click on Type dropdown
	Then Verify Employee option is visible
	When Select Employee option
	When Click Home contact number country code
	Then Select US country code for Home
	Then Enter the contact number for Home	
	When Click Mobile contact number country code
	Then Select US country code for Mobile
	Then Enter the contact number for Mobile	
	When Click Fax contact number country code
	Then Select US country code for Fax
	Then Enter the contact number for Fax	
	When Enter the Dept value
	Then Verify that Save button is enabled
	When Click "Save" button
	Then Verify Update Profile toaster message appears
	When User Page is displayed
	Then Verify User Type is Employee
	When Click User Profile button
	Then Verify Edit Profile option is displayed
	When Click Edit Profile option
	Then Verify Edit User page is displayed
	Then Verify the User Type is Employee
	Then Verify the Home contact country code is US
	Then Verify the Home contact number value	
	Then Verify the Mobile contact country code is US
	Then Verify the Mobile contact number value
	Then Verify the Fax contact country code is US
	Then Verify the Fax contact number value
	Then Verify the Dept textbox value
	When Click Cancel Button
	When Click "Confirm" button
	Then Verify Users page is displayed	


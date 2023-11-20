@Regression
Feature: User

 @Sanity
Scenario: Create User and Assign SOC Team,SOC Analyst Role
	Given Navigate to page "/security/people"
	When Click Add Person button 
	When Enter User Details 
	When Click SOC Admin Team 
	And Select user role
	| SOC Analyst |
	When Click Save button 
	Then Verify User is created
	
 @Sanity
Scenario: Admin changes/reset the new user's password
	Given Verify execution of below scenarios is successful
		| Create User and Assign SOC Team,SOC Analyst Role |
	When Click row "1" of grid
	When Click On Reset Password 
	When Click New Password 
	When Click Confirm Password 
	When Click Submit button 
	Then Verfy password is Reset

 @Sanity
Scenario: New user logs in with given roles and permissions
	Given Verify execution of below scenarios is successful
		| Admin changes/reset the new user's password |
	Given Navigate to page "/logout"
	When  Enter New User Username
	When  Enter New User Password
	When  Click Login Button
	Then  Verify the user is logged in
	When Navigate to page "/content-hub/all-content/"
	Then Verify Visible text
	|Text Type|Text to Search|Tag|
	|Access validation|You don't have necessary permissions to interact with the Content Hub.|h6|


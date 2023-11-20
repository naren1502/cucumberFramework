@Regression
Feature: Roles


  Scenario: Create custom role
    Given Verify execution of below scenarios is successful
      | Create New Custom Module |
    Given Click Setting Button
    Given Verify Roles option is visible
    When Click Roles
    Then Verify Roles Page is displayed
    When Click Add Role button
    Then Verify New Role page opens
    When Add role description
    Then Verify Role Name is a mandatory field
    When Enter role name
    Then Verify Credit Cards Module is present
    When Select Credit Cards CRUD Permissions
    When Click Save button
    Then Verify Toaster message on Role save
    Then Verify Roles Page is displayed
    When Click custom role to edit
    Then Verify Edit custom role page is displayed
    Then Verify Save Role Permission button is disabled
    Then Verify Role Name is saved
    Then Verify CRUD Permissions are selected
    When Click Cancel button on Edit Role page
    Then Verify Roles Page is displayed


  Scenario: Assign custom role to user
    Given Verify execution of below scenarios is successful
      | Custom module Remove Field                  |
      | Admin changes/reset the new user's password |
    Given Navigate to page "/security/people"
    When Click On Created User
    Then Verify Edit User page is displayed
    When Click Custom Role
    When Click Save button
    Then Verify user update toaster message appears
    Given Navigate to page "/logout"
    When  Enter New User Username
    When  Enter New User Password
    When  Click Login Button
    Then  Verify the user is logged in
    When Navigate to page "/modules/credit_cards"
    When Click Add Credit Cards button
    Then Verify Create New Credit Card form is displayed
    When Add Credit Card details
      | Card_Number | CVV  |
      | 321456987   | 4053 |
    #wait till save button is enabled
    When Wait for specified time
      | 2 |
    When Click button "Save"
    Then Verify value of "Card Number" on Record Detail as "321456987"
    And Verify value of "CVV" on Record Detai as "4053"


  Scenario: Delete custom role
    Given Navigate to page "/logout"
    When Login to FortiSOAR
      | Username | Password     |
      | csadmin  | UserPassword |
    Given Create a custom role "role_to_be_deleted" with below data
      | Application | R |
    When Navigate to page "/security/roles"
    Given Verify Roles Page is displayed
    When Filter grid column "Name" by entering "role_to_be_deleted" in column level search box filter
    Then Select record no "1" from grid
    When Click delete role button
    Then Delete confirmation dialogue is displayed
    When Click Confirm
    Then Verify Delete Role toaster message is displayed
    Then Verify below grid records are not present on grid detail view
      | Name               |
      | role_to_be_deleted |



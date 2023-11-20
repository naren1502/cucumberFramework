@Regression
Feature: RBAC

  Scenario: Import Roles and Users
    # Importing test data such as user, role and playbooks to execute
    When Navigate to page "/editor/importer"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page header | Import Wizard  | h1  |
    When Click "Import From File" button
    Then Verify Visible text
      | Text Type     | Text to Search | Tag |
      | Wizard header | Import Wizard  | h3  |
    Then Verify "Configurations" tab is not highlighted
    When Select file
      | FileName         | FilePath |
      | UI-Auto-RBAC.zip |          |
    Then Verify Configurations list is visible
    Then Verify "Configurations" tab is highlighted
    Then Verify "Options" tab is not highlighted
    Then Verify select all checkbox is selected
    When Click "Continue" button
    Then Verify "Options" tab is highlighted
    When Verify entity count is correct
      | Entity              | Count |
      | Role                | 1     |
      | Playbook Collection | 1     |
      | User                | 1     |
    When Click Continue button on Options tab
    Then Verify "Run Import" tab is highlighted
    Then Verify Visible text
      | Text Type | Text to Search | Tag |
      | Page Text | Review Import  | h3  |
    Then Verify entity count
      | Role                |
      | Playbook Collection |
    When Click "Run Import" button
    Then Wait for Import to complete
      | Total Time | Polling Time |
      | 360        | 5            |
    When Click "Done" button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page header | Import Wizard  | h1  |
    Then Verify Import grid record
      | File             | Status          |
      | UI-Auto-RBAC.zip | Import Complete |
    Then Navigate to Users page
    When Select user "rbacadmin"
    Then Verify Edit User page is displayed
    When Click On Reset Password
    When Click New Password
    When Click Confirm Password
    When Click Submit button
    Then Verify toaster message appears
      | Password changed successfully. |
    Then Create below records for "assets" module via api call
      | name                 |
      | UIAuto RBAC Asset 01 |
    Then Navigate to page "/logout"
    When Login to FortiSOAR
      | Username  | Password  |
      | rbacadmin | Demo@1234 |
    When Wait for specified time
      | 2 |
    Then verify user "rbacadmin" is logged in


  Scenario: Verify user can read the record with read access
    Given Verify execution of below scenarios is successful
      | Import Roles and Users |
    When Navigate to page "/modules/assets"
    When Wait for specified time
      | 3 |
    Then Verify User Navigated to Assets
    Then Verify value of "Display Name" is Present on Grid View


  Scenario: Verify user can't add the record without add access
    Given Verify execution of below scenarios is successful
      | Import Roles and Users |
    When Navigate to page "/modules/assets"
    When Wait for specified time
      | 3 |
    Then Verify User Navigated to Assets
    Then Verify button "Add" is not visible


  Scenario: Verify user can't edit the record without update access
    Given Verify execution of below scenarios is successful
      | Import Roles and Users |
    When Navigate to page "/modules/assets"
    When Wait for specified time
      | 3 |
    Then Verify User Navigated to Assets
    Then Verify value of "Display Name" is Present on Grid View
    When Click row "1" of grid
    Then Verify button "Edit Record" is disabled


  Scenario: Verify user can't delete the record without delete access
    Given Verify execution of below scenarios is successful
      | Import Roles and Users |
    When Navigate to page "/modules/assets"
    When Wait for specified time
      | 3 |
    Then Verify User Navigated to Assets
    Then Verify value of "Display Name" is Present on Grid View
    When Click row "1" of grid
    Then Verify button "Delete Record" is not visible

  Scenario: Verify user can create Dashboard with read and create permission
    Given Verify execution of below scenarios is successful
      | Import Roles and Users |
    When Navigate to page "/dashboard"
    When Click Dashboard Setting Button
    Then Verify Dashboard Menu is displayed
    When Click New Dashboard option
    When Enter dashboard template title "QA RBAC Dashboard"
    When Click Apply Changes button
    Then Verify toaster message appears
      | Template Saved |

  Scenario: Verify user can't update Dashboard with read and create permission
   Given Verify execution of below scenarios is successful
     | Import Roles and Users |
    When Navigate to page "/dashboard"
    When Click Dashboard Setting Button
    Then "Option" "Dashboard_MenuOption_EditDashboard" is not visible on "Dashboard setting page"

  Scenario: Verify user can't delete Dashboard with read and create permission
    Given Verify execution of below scenarios is successful
      | Import Roles and Users |
    When Navigate to page "/dashboard"
    When Click Dashboard Setting Button
    Then "Option" "Dashboard_MenuOption_DeleteDashboard" is not visible on "Dashboard setting page"

  Scenario: Verify user can  create when create access on a incident module
    Given Verify execution of below scenarios is successful
      | Import Roles and Users |
    When Navigate to page "/modules/incidents"
    When Click "Button" "Add-Button-Incidents" on "Incident Grid page" using locator type "id"
    When Enter text "UIAuto RBAC Incident 01" in "Incident_Text_Name" on "Incident Grid pag" using locator type "id"
    When Click "Button" "Btn_Record_Save" on "Add Incident"
    Then Verify toaster message appears
      | You have created "UIAuto RBAC Incident 01" |

  Scenario: Verify user can read the incident with create access on a incident module
    Given Verify execution of below scenarios is successful
      | Import Roles and Users |
    When Navigate to page "/modules/incidents"
    Then Incident Page is displayed
    Then Verify value of "Name" is Present on Grid View

  Scenario: Verify user can't update the incident with create access on a incident module
    Given Verify execution of below scenarios is successful
      | Import Roles and Users |
    When Navigate to page "/modules/incidents"
    Then Incident Page is displayed
    Then Verify value of "Name" is Present on Grid View
    When Select "Incidents" record at row "1"
    Then "Button" "IncidentGrid_button_changeSeverity" is not present on "Incident Grid View" using locator type "id"

  Scenario: Verify user can't delete the incident with create access on a incident module
    Given Verify execution of below scenarios is successful
      | Import Roles and Users |
    When Navigate to page "/modules/incidents"
    Then Incident Page is displayed
    Then Verify value of "Name" is Present on Grid View
    When Select "Incidents" record at row "1"
    Then "Button" "IncidentGrid_button_delete" is not present on "Incident Grid View" using locator type "id"

  Scenario: Verify user can clone record when create access on a incident module
    Given Verify execution of below scenarios is successful
      | Import Roles and Users |
    When Navigate to page "/modules/incidents"
    Then Verify value of "Name" is Present on Grid View
    When Select "Incidents" record at row "1"
    Then "Button" "Incident_Button_Clone" is present on "Incident Grid View" using locator type "id"

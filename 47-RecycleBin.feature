@Regression
Feature: RecycleBin


  Scenario: Verify default modules available in recycle bin
    Given Navigate to page "/recyclebin"
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Recycle Bin    | span |
    Then Verify default modules listed
      | Playbooks            |
      | Playbook Collections |


  Scenario: Verify deleted Playbook and collection available in Recycle Bin
    Given Navigate to page "/playbooks/collections"
    Given Verify User Navigated to Playbooks
    When Import Playbook Collection "Collection_RecycleBin.json"
    When Search Playbook Collection for RecycleBin
    When Select RecycleBin Playbook Collection
    Then Delete button is displayed
    When Click Delete button
    Then Verify Visible text
      | Text Type    | Text to Search              | Tag  |
      | Popup Header | Confirm Collection Deletion | span |
    When Click "Move to Recycle Bin" button
    Then Verify Delete toaster message
    When Navigate to page "/recyclebin"
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Recycle Bin    | span |
    Then Verify grid row "PB_RecycleBin" is present
    When Select "Playbook Collections" as Recycle Bin module
    Then Verify grid row "Collection_RecycleBin" is present


  Scenario: Verify Playbook delete audit log
    Given Verify execution of below scenarios is successful
      |Verify deleted Playbook and collection available in Recycle Bin|
    Given Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    When Select "Unlink" operation
    Then Verify audit log entry
      |Title|Record Type|Operation|User|
      |Playbook Collection [Collection_RecycleBin] Unlinked from Playbook [PB_RecycleBin]|Playbook|Unlink|CS Admin|
    When Select "Soft Delete" operation
    Then Verify audit log entry
      |Title|Record Type|Operation|User|
      |Playbook Collection [Collection_RecycleBin] Moved to bin|Playbook Collection|Soft Delete|CS Admin|


  Scenario: Verify Enable Recycle Bin for Alerts module
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    Then Verify Create New Module is selected
    When Select Alerts module
    Then Verify Alerts module selected
    Then Enable Recycle Bin checkbox is displayed
    When Click "Enable Recycle Bin" label
    When Click on MMD Save Button
    Then Verify Save button is disabled
    Then Verify Publish button is enabled
    When Click on Publish button
    Then Verify Publish page is displayed
    Then Verify Publish button is disabled
    When Navigate to page "/recyclebin"
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Recycle Bin    | span |
    Then Verify default modules listed
      | Playbooks            |
      | Playbook Collections |
      | Alerts               |


  Scenario: Verify Deleted Alert record moved to Recycle Bin
    Given Verify execution of below scenarios is successful
      | Verify Enable Recycle Bin for Alerts module |
    Given Navigate to page "/modules/alerts"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Alerts         | span |
    When Click on Add Alert
    Then Alert creation form is displayed
    And Add record details
      | Name                      |
      | AlertCreatedForRecycleBin |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForRecycleBin". |
    When Click "Delete Record" button
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Confirm        | span |
    When Click "Move to Recycle Bin" button
    When Navigate to page "/recyclebin"
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Recycle Bin    | span |
    When Select "Alerts" as Recycle Bin module
    Then Verify grid row "AlertCreatedForRecycleBin" is present


  Scenario: Verify Alert delete audit log
    Given Verify execution of below scenarios is successful
      | Verify Deleted Alert record moved to Recycle Bin|
    Given Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    When Select "Soft Delete" operation
    Then Verify audit log entry
      |Title|Record Type|Operation|User|
      |Alert [AlertCreatedForRecycleBin] Moved to bin|Alert|Soft Delete|CS Admin|


  Scenario: Verify Restore record from Recycle Bin
    Given Verify execution of below scenarios is successful
      | Verify Deleted Alert record moved to Recycle Bin|
    Given Navigate to page "/recyclebin"
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Recycle Bin    | span |
    When Select "Alerts" as Recycle Bin module
    Then Verify grid row "AlertCreatedForRecycleBin" is present
    When Select record no "1" from grid
    Then Click "Restore" button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Confirm        | span |
    Then Click "Confirm" button
    When Navigate to page "/modules/alerts"
    Then Verify grid row "AlertCreatedForRecycleBin" is present


  Scenario: Verify Alert restore audit log
    Given Verify execution of below scenarios is successful
      |Verify Restore record from Recycle Bin|
    Given Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    When Select "Restore" operation
    Then Verify audit log entry
      |Title|Record Type|Operation|User|
      |Alert [AlertCreatedForRecycleBin] Restored from bin|Alert|Restore|CS Admin|


  Scenario: Verify Permanent delete record from module grid
    Given Verify execution of below scenarios is successful
      |Verify Restore record from Recycle Bin|
    Given Navigate to page "/modules/alerts"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Alerts         | span |
    When Filter grid column "Name" by entering "AlertCreatedForRecycleBin" in column level search box filter
    Then Verify grid row "AlertCreatedForRecycleBin" is present
    When Select record no "1" from grid
    Then Click "Delete" button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Confirm        | span |
    Then Click "Permanently Delete" button
    Then Verify toaster message appears
      | 1 record(s) deleted. |
    Then Verify record deleted permanently
    When Navigate to page "/recyclebin"
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Recycle Bin    | span |
    When Select "Alerts" as Recycle Bin module
    Then Verify record deleted permanently


  Scenario: Verify Permanent delete record from Recycle bin
    Given Verify execution of below scenarios is successful
      | Verify Enable Recycle Bin for Alerts module |
    Given Navigate to page "/modules/alerts"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Alerts         | span |
    When Click on Add Alert
    Then Alert creation form is displayed
    And Add record details
      | Name                      |
      | AlertCreatedForRecycleBin_Perm_Del |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForRecycleBin_Perm_Del". |
    When Click "Delete Record" button
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Confirm        | span |
    When Click "Move to Recycle Bin" button
    When Navigate to page "/recyclebin"
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Recycle Bin    | span |
    When Select "Alerts" as Recycle Bin module
    #Need to include search record step
    Then Verify grid row "AlertCreatedForRecycleBin_Perm_Del" is present
    When Select record no "1" from grid
    Then Click "Delete Permanently" button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Confirm        | span |
    Then Click "Confirm" button
    Then Verify toaster message appears
      | 1 record(s) deleted. |
    Then Verify record deleted permanently


  Scenario: Verify Permanent delete all records from Recycle bin
    Given Verify execution of below scenarios is successful
      | Verify deleted Playbook and collection available in Recycle Bin |
    Given Navigate to page "/recyclebin"
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Recycle Bin    | span |
    When Select "Playbooks" as Recycle Bin module
    Then Verify grid row "PB_RecycleBin" is present
    When Click Permanently Delete All Playbook Records button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Confirm        | span |
    Then Click "Confirm" button
    Then Verify toaster message appears
      | All records of Playbook deleted successfully |
    Then Verify record deleted permanently


  Scenario: Verify Bulk Delete 250 records
    Given Import Playbook Collection "BulkCollection_RB.json"
    When Wait for specified time
      | 5 |
    Then Navigate to page "/modules/alerts"
    When Click "Execute" button
    When Wait for specified time
      | 5 |
    Then Verify Search Playbook field displayed
    Then Verify Playbook is available for execution
      | Ingest 250 Alerts |
    When Select Playbook from execution window
      | Ingest 250 Alerts |
    Then Verify toaster message appears
      | Triggered action "Ingest 250 Alerts". |
    #Wait for PB execution to be complete
    When Wait for specified time
      | 25 |
    When Verify items per page value
      |30|
    When Update items per page value
      |250|
    When Wait for specified time
      | 10 |
    When Filter grid column "Source" by entering "Automation" in column level search box filter
    When Wait for specified time
      | 15 |
    When Click grid select all checkbox
    Then Click delete button on grid
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Confirm        | span |
    When Click "Move to Recycle Bin" button
    When Navigate to page "/recyclebin"
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Recycle Bin    | span |
    When Select "Alerts" as Recycle Bin module

    When Update items per page value
      |250|

    Then Verify grid item count is "250"
    When Click grid select all checkbox
    Then Click "Restore" button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Confirm        | span |
    Then Click "Confirm" button
    When Navigate to page "/modules/alerts"
    When Update items per page value
      |250|

    Then Verify grid item count is "250"
    When Update items per page value
      |250|
    When Wait for specified time
      | 5 |
    When Filter grid column "Source" by entering "Automation" in column level search box filter
    When Wait for specified time
      | 5 |
    When Click grid select all checkbox
    Then Click "Delete" button
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Confirm        | span |
    Then Click "Move to Recycle Bin" button


  Scenario: Verify Empty Recycle bin functionality
    Given Verify execution of below scenarios is successful
      |Verify Bulk Delete 250 records|
    Given Navigate to page "/recyclebin"
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Recycle Bin    | span |
    When Click Empty Recycle Bin button
    Then Verify Visible text
      | Text Type   | Text to Search          | Tag  |
      | Page Header | Confirm Record Deletion | h3 |
    Then Click "OK" button
    Then Verify toaster message appears
      | All records deleted successfully. |
    Then Verify record deleted permanently
    When Select "Playbook Collections" as Recycle Bin module
    Then Verify record deleted permanently
    When Select "Alerts" as Recycle Bin module
    Then Verify record deleted permanently
    When Click Empty Recycle Bin button
    Then Verify Visible text
      | Text Type   | Text to Search          | Tag  |
      | Page Header | Confirm Record Deletion | h3 |
    Then Click "OK" button
    Then Verify toaster message appears
      | Recycle bin is already empty. |


  Scenario: Verify Restrict Permanent Delete
    Given Verify execution of below scenarios is successful
      | Verify Enable Recycle Bin for Alerts module |
    When Navigate to page "/modules/alerts"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Alerts         | span |
    When Click on Add Alert
    Then Alert creation form is displayed
    And Add record details
      | Name                      |
      | AlertCreatedForRecycleBin_Restrict_Del |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForRecycleBin_Restrict_Del". |
    When Click "Delete Record" button
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Confirm        | span |
    When Click "Move to Recycle Bin" button
    When Navigate to page "/system/system-configuration/application-configuration"
    Then System configuration page is displayed
    Then Select Restrict Permanent Delete checkbox for recycle bin
    Then Click "Save" button
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
      | FileName              | FilePath |
      | UI_Auto_Export_04.zip |          |
    Then Verify Configurations list is visible
    Then Verify "Configurations" tab is highlighted
    Then Verify "Options" tab is not highlighted
    Then Verify select all checkbox is selected
    When Click "Continue" button
    Then Verify "Options" tab is highlighted
    When Verify entity count is correct
      | Entity                 | Count |
      | Role                   |     1 |
      | User                   |     1 |
    When Click "Role" tab
    Then Verify grid entry
      | RB limited access |
    When Click "User" tab
    Then Verify grid entry
      | RBuser RBuser |
    When Click Continue button on Options tab
    Then Verify "Run Import" tab is highlighted
    Then Verify Visible text
      | Text Type | Text to Search | Tag |
      | Page Text | Review Import  | h3  |
    Then Verify entity count
      | Role                   |
      | User                   |
    When Click "Run Import" button
    Then Verify Visible text
      | Text Type | Text to Search | Tag |
      | Page Text | Running Import | h3  |
    Then Wait for Import to complete
      | Total Time | Polling Time |
      |        180 |            5 |
    When Click "Done" button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page header | Import Wizard  | h1  |
    Then Verify Import grid record
      | File                  | Status          |
      | UI_Auto_Export_04.zip | Import Complete |
    Then Navigate to Users page
    When Select user "RBuser"
    Then Verify Edit User page is displayed
    When Click On Reset Password
    When Click New Password
    When Click Confirm Password
    When Click Submit button
    Then Verify toaster message appears
      | Password changed successfully. |
    When Navigate to page "/logout"
    Then Login to FortiSOAR
      | Username | Password  |
      | rbuser    | Demo@1234 |
    When Navigate to page "/recyclebin"
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Recycle Bin    | span |
    When Select "Alerts" as Recycle Bin module
    Then Verify grid row "AlertCreatedForRecycleBin_Restrict_Del" is present
    When Select record no "1" from grid
    Then Verify "Delete Permanently" button is not present
    Then Verify "Permanently Delete All Alert Records" button is not present
    Then Verify "Empty Recycle Bin" button is not present
    When Navigate to page "/logout"
    Then Login to FortiSOAR
      | Username | Password  |
      | csadmin    | Demo@1234 |


  Scenario: Verify Disable Recycle bin for Alerts module
    Given Verify execution of below scenarios is successful
       | Verify Enable Recycle Bin for Alerts module |
       | Verify Restrict Permanent Delete            |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    Then Verify Create New Module is selected
    When Select Alerts module
    Then Verify Alerts module selected
    Then Enable Recycle Bin checkbox is displayed
    When Click "Enable Recycle Bin" label
    When Click on MMD Save Button
    Then Verify Save button is disabled
    Then Verify Publish button is enabled
    When Click on Publish button
    Then Verify Publish page is displayed
    Then Verify Publish button is disabled
    When Navigate to page "/recyclebin"
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Recycle Bin    | span |
    Then Verify default modules listed
      | Playbooks            |
      | Playbook Collections |


  Scenario: Enable Recycle Bin Purge Schedule
    Given Navigate to page "/system/system-configuration/application-configuration"
    Then System configuration page is displayed
    Then Select Enable Purging checkbox for recycle bin
    When Click "Save" button
    Then Verify recycle bin schedule status is "ACTIVE"
    When Click recycle bin view schedule button
    Then Verify Visible text
      | Text Type  | Text to Search      | Tag  |
      | Page title | Schedule Details    | h3 |
    When Set schedule to one min
    Then Click "Save" button
    Then Click "Close" button
    Then Click executed playbook logs
    When Remove applied tag filters for playbook execution history

    Then Search playbook in executed playbook logs
      | Recycle Bin Cleanup |
    When Click Setting Button
    Then System configuration page is displayed
    Then Select Enable Purging checkbox for recycle bin
    When Click "Save" button


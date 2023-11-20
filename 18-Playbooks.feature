@Regression @FireFlinkTestsToBeShared -  Create On Trigger Playbook, Reference Block
Feature: Playbooks

   @Sanity
  Scenario: Create new Playbook collection
    Given Navigate to page "/playbooks/collections/"
    When Click New Collection
    Then Verify Add New Playbook Collection Popup displayed
    When Enter Collection Name
    Then Verify Create Button is Enabled
    When Click button "Create"
    Then Verify User is navigated to Playbook collection
    Then Verify New Playbook Collection is Created

   @Sanity
  Scenario: Create new Playbook
    Given Verify execution of below scenarios is successful
      | Create new Playbook collection |
    Given Add Playbook button is displayed
    When Click Add Playbook
    Then Verify Playbooks creation form is displayed
    When Enter playbook details
    Then Verify Playbook Create button is enabled
    When Click Create Playbook button
    Then Verify Playbook Creation page is displayed
    When Click on Manual Trigger
    Then Verify Manual Trigger step details page is displayed
    When Enter Manual Trigger step details
    When Click Step Save button
    Then Verify Manual Trigger Step is added
    When Drag step connector point
    Then Verify Steps are displayed
    When Click Create Record step
    Then Verify Create Record step details page is displayed
    When Enter Create Record step details
    When Click Step Save button
    Then Verify Create Record Step is added
    Then Verify execution mode on designer is "INFO"
    When Click "INFO" button
    When "Select Execution Log Level" Filter is Set to "DEBUG"
    Then Click "Apply" button
    Then Verify execution mode on designer is "DEBUG"
    When Save Playbook button is enabled
    Then Verify Click Save Playbook
    Then Verify Playbook save Toaster message


  Scenario: Edit Playbook Collection name
    Given Verify execution of below scenarios is successful
      | Create new Playbook |
    Given Navigate to page "/playbooks/collections"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Playbooks      | span |
    When Search Playbook Collection
    Then Selected Playbook Collection is displayed
    When Enter updated Collection Name
    Then Verify Playbook Collection name is updated
    When Clear Playbook Collection Search field
    Then Verify updated Collection name is displayed in the list


  Scenario: Export Playbook
    Given Verify execution of below scenarios is successful
      | Create new Playbook |
    Given Navigate to page "/playbooks/collections"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Playbooks      | span |
    When Click collection having Playboooks
    Then Verify Playbooks are listed
    When Select Playbook to export
    Then Verify Export option is displayed
    When Click on Export
    Then Verify Confirmation pop-up is displayed to include playbook versions
    When Select No, only playbooks
    Then Verify Playbook is exported successfully


  Scenario: Create On Create Trigger Playbook
    Given Verify execution of below scenarios is successful
      | Edit Playbook Collection name |
    Given Navigate to page "/playbooks/collections"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Playbooks      | span |
    Then Verify specific playbook collection name is present in list
      | Updated_collection |
    When Select specific playbook collection
      | Updated_collection |
    Then Add Playbook button is displayed
    When Click Add Playbook
    Then Verify Playbooks creation form is displayed
    When Enter On Create playbook details
    Then Verify Playbook Create button is enabled
    When Click Create Playbook button
    Then Verify On Create Playbook Creation page is displayed
    When Click On Create Trigger
    Then Verify On Create Trigger step details page is displayed
    When Enter On Create Trigger step details
    When Click Step Save button
    Then Verify On Create Trigger Step is added
    When Drag On Create step connector point
    Then Verify Steps are displayed
    When Click Set Variable step
    Then Verify Set Variable step details page is displayed
    When Enter Set Variable step details
    When Click Step Save button
    Then Verify Set Variable Step is added
    When Save Playbook button is enabled
    Then Verify Click Save Playbook
    Then Verify Playbook save Toaster message
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click on Add Alert
    Then Alert creation form is displayed
    #Then Add alert details
    And Add record details
      | Name                                  |
      | AlertCreatedForOnCreatePBVerification |
    Then Save Current Time
    When Click button "Save"
    #Then Verify Alert Detail View is displayed
    Then Verify toaster message appears
      | You have created "AlertCreatedForOnCreatePBVerification". |
    When Click executed playbook logs
    Then Search playbook in executed logs
      | On Create PB |
    Then Compare record creation and playbook execution time
    Then Close Playbook Execution log Window
    When Click executed playbook logs
    Then Search playbook in executed logs
      | On Create PB |
    Then Compare record creation and playbook execution time
    Then Close Playbook Execution log Window



  Scenario: Deactivate Playbook
    Given Verify execution of below scenarios is successful
      | Create On Create Trigger Playbook |
    Given Navigate to page "/playbooks/collections"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Playbooks      | span |
    Then Verify specific playbook collection name is present in list
      | Updated_collection |
    When Select specific playbook collection
      | Updated_collection |
    Then Add Playbook button is displayed
    When Search playbook in collection
      | On Create PB |
    When Select Searched Playbook
    Then Verify Deactivate Button is visible
    When Click Deactivate Button
    Then Verify Playbook Deactivated Toaster message
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click on Add Alert
    Then Alert creation form is displayed
    Then Add alert details
    Then Save Current Time
    When Click on Save Button
    Then Verify Alert Detail View is displayed
    Then Close Record Detail View
    When Click executed playbook logs
    Then Search playbook in executed logs
      | On Create PB |
    Then Compare playbook execution time and record creation time
    Then Close Playbook Execution log Window



  Scenario: Activate Playbook
    Given Verify execution of below scenarios is successful
      | Deactivate Playbook |
    Given Navigate to page "/playbooks/collections"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Playbooks      | span |
    Then Verify specific playbook collection name is present in list
      | Updated_collection |
    When Select specific playbook collection
      | Updated_collection |
    Then Add Playbook button is displayed
    When Search playbook in collection
      | On Create PB |
    When Select Searched Playbook
    Then Verify Activate Button is visible
    When Click Activate Button
    Then Verify Playbook Activated Toaster message
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click on Add Alert
    Then Alert creation form is displayed
    Then Add alert details
    Then Save Current Time
    When Click on Save Button
    Then Verify Alert Detail View is displayed
    When Click executed playbook logs
    Then Search playbook in executed logs
      | On Create PB |
    Then Compare record creation and playbook execution time
    Then Close Playbook Execution log Window


  Scenario: Clone Playbook
    Given Verify execution of below scenarios is successful
      | Deactivate Playbook |
    Given Navigate to page "/playbooks/collections"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Playbooks      | span |
    Then Verify specific playbook collection name is present in list
      | Updated_collection |
    When Select specific playbook collection
      | Updated_collection |
    Then Add Playbook button is displayed
    When Search playbook in collection
      | On Create PB |
    When Select Searched Playbook
    Then Verify Clone Button is visible
    When Click Clone Button
    Then Verify Playbook Cloned Toaster message
    When Search playbook in collection
      | On Create PB | (1) |


  Scenario: Move Playbook
    Given Verify execution of below scenarios is successful
      | Clone Playbook |
    Given Navigate to page "/playbooks/collections"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Playbooks      | span |
    When Click New Collection
    Then Verify Add New Playbook Collection Popup displayed
    When Enter specific playbook collection name
      | New_collection |
    Then Verify Create Button is Enabled
    When Click button "Create"
    Then Verify specific playbook collection name is present in list
      | New_collection |
    When Clear Playbook Collection Search field
    Then Verify updated Collection name is displayed in the list
    When Select Updated Playbook Collection
    Then Search playbook in collection
      | On Create PB | (1) |
    When Select Searched Playbook
    Then Verify Move button is visible
    When Click Move button
    Then Verify Move Playbook window opens
    When Select Collection
    When Click Submit button
    Then Verify Playbook Moved Toaster message
    Then Verify specific playbook collection name is present in list
      | New_collection |
    When Select specific playbook collection
      | New_collection |
    Then Search playbook in collection
      | On Create PB |


  Scenario: Delete Playbook
    Given Verify execution of below scenarios is successful
      | Move Playbook |
    When Select Searched Playbook
    Then Verify Delete button is visible
    When Click Playbook Delete button
    Then Verify delete confirmation popup is displayed
    When Click "Permanently Delete" button
    Then Verify Playbook Delete Toaster message
    Then Verify playbook is deleted


  Scenario: Create On Update Trigger Playbook
    Given Verify execution of below scenarios is successful
      | Edit Playbook Collection name |
    Given Navigate to page "/playbooks/collections"
    Then Verify specific playbook collection name is present in list
      | Updated_collection |
    When Select specific playbook collection
      | Updated_collection |
    Then Add Playbook button is displayed
    When Click Add Playbook
    Then Verify Playbooks creation form is displayed
    When Enter On Update playbook details
    Then Verify Playbook Create button is enabled
    When Click Create Playbook button
    Then Verify On Update Playbook Creation page is displayed
    When Click On Update Trigger
    Then Verify On Update Trigger step details page is displayed
    When Enter On Update Trigger step details
    When Click Step Save button
    Then Verify On Update Trigger Step is added
    When Drag On Update step connector point
    Then Verify Steps are displayed
    When Click Set Variable step
    Then Verify Set Variable step details page is displayed
    When Enter Set Variable step details
    When Click Step Save button
    Then Verify Set Variable Step is added
    When Save Playbook button is enabled
    Then Verify Click Save Playbook
    Then Verify Playbook save Toaster message
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    Then Verify Record is present in Grid
      | New_Alert_TIME_STAMP |
    Then Open Alert Detailed view
      | New_Alert_TIME_STAMP |
    Then Verify Change Severity button is visible
    When Select High Severity
    Then Save Current Time
    Then Verify Severity is updated
    When Click executed playbook logs
    Then Search playbook in executed logs
      | On Update PB |
    Then Compare record updation and playbook execution time
    Then Close Playbook Execution log Window
    When Click executed playbook logs
    Then Search playbook in executed logs
      | On Update PB |
    Then Compare record updation and playbook execution time
    Then Close Playbook Execution log Window



  Scenario: Create On Delete Trigger Playbook

    Given Verify execution of below scenarios is successful
      | Edit Playbook Collection name |
    Given Navigate to page "/playbooks/collections"
    Given Clear Playbook Collection Search field
    Then Verify updated Collection name is displayed in the list
    When Select Updated Playbook Collection
    Then Add Playbook button is displayed
    When Click Add Playbook
    Then Verify Playbooks creation form is displayed
    When Enter On Delete playbook details
    Then Verify Playbook Create button is enabled
    When Click Create Playbook button
    Then Verify On Delete Playbook Creation page is displayed
    When Click On Delete Trigger
    Then Verify On Delete Trigger step details page is displayed
    When Enter On Delete Trigger step details
    When Click Step Save button
    Then Verify On Delete Trigger Step is added
    When Drag On Delete step connector point
    Then Verify Steps are displayed
    When Click Set Variable step
    Then Verify Set Variable step details page is displayed
    When Enter Set Variable step details
    When Click Step Save button
    Then Verify Set Variable Step is added
    When Save Playbook button is enabled
    Then Verify Click Save Playbook
    Then Verify Playbook save Toaster message
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click Add record button
    And Add record details
      | Name                                  |
      | AlertCreatedForOnDeletePBVerification |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForOnDeletePBVerification". |
    Then Save Current Time
    When Click on Delete button
    Then Verify Visible text
      | Text Type    | Text to Search | Tag  |
      | Popup header | Confirm        | span |
    When Click button "Confirm"
    Then Alert Grid is displayed
    When Click executed playbook logs
    When Search playbook in executed logs
      | On Delete PB |
    Then Compare record deletion and playbook execution time
    Then Close Playbook Execution log Window



  Scenario: Search status field in Playbook Execution history with INFO mode
    Given Verify execution of below scenarios is successful
      | Create On Delete Trigger Playbook |
    And Allow individual playbook level logging settings to override global settings
    And Navigate to page "/playbooks/collections"
    When Click executed playbook logs
    When Search playbook in executed logs
      | On Delete PB |
    Then Verify execution mode on execution history is "INFO"
    When Select step
      | On Delete Trigger |
    When Enter field to search in execution history
      | status |
    Then Verify field is present
      | status |
    Then Compare serached fields value in execution history
      | status | finished |
    Then Close step execution details
    When Select step
      | Configuration |
    When Enter field to search in execution history
      | status |
    Then Verify field is present
      | status |
    Then Compare serached fields value in execution history
      | status | finished |



  Scenario: Execute Manual Trigger Playbook with Debug mode

    Given Verify execution of below scenarios is successful
      | Create new Playbook |
    And Allow individual playbook level logging settings to override global settings
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click Add record button
    And Add record details
      | Name                                       |
      | AlertCreatedForManualTriggerPBVerification |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForManualTriggerPBVerification". |
    When Click Execute Button
    Then Verify Search Playbook field displayed
    Then Verify Playbook is available for execution
      | Trigger Step |
    Then Save Current Time
    When Select Playbook from execution window
      | Trigger Step |
    Then Verify Playbook execution toaster message
    Then Click executed playbook logs
    When Search playbook in executed logs
      | Playbook |
    Then Compare trigger time and playbook execution time
    Then Verify execution mode on execution history is "DEBUG"
    When Select step
      | Create Record |
    When Enter field to search in execution history
      | name |
    Then Verify field is present
      | name |
    Then Compare serached fields value in execution history
      | name | Sample AlertTIMESTAMP |
    Then Clear serached fields value in execution history
    When Enter field to search in execution history
      | priorityWeight |
    Then Verify field is present
      | priorityWeight |
    Then Compare serached fields value in execution history
      | priorityWeight | 1 |
    Then Close Playbook Execution log Window



  Scenario: Import Playbook
    Given Verify execution of below scenarios is successful
      | Edit Playbook Collection name |
    Given Navigate to page "/playbooks/collections"
    Then Verify specific playbook collection name is present in list
      | Updated_collection |
    When Select specific playbook collection
      | Updated_collection |

    When Click Import playbook button
    Then Verify Visible text
      | Text Type    | Text to Search   | Tag |
      | Popup Header | Import Playbooks | h3  |
    When Select file
      | FileName                             | FilePath |
      | Auto_ManualTriggerwithVariables.json |          |
    Then Verify Visible text
      | Text Type     | Text to Search                  | Tag |
      | Playbook Name | Auto_ManualTriggerwithVariables | h5  |
    Then Verify "Import" button is enabled
    When Click Import playbook button
    Then Search playbook in collection
      | Auto_ManualTriggerwithVariables |


  Scenario: Delete empty Playbook Collection
    Given Navigate to page "/playbooks/collections"
    Given Verify User Navigated to Playbooks
    When Click New Collection
    Then Verify Add New Playbook Collection Popup displayed
    When Enter Collection Name
    Then Verify Create Button is Enabled
    When Click button "Create"
    Then Verify User is navigated to Playbook collection
    When Search Playbook Collection
    When Select Playbook Collection
    Then Delete button is displayed
    When Click Delete button
    Then Verify Visible text
      | Text Type    | Text to Search              | Tag  |
      | Popup Header | Confirm Collection Deletion | span |
    When Click "Permanently Delete" button
    Then Verify Playbook Collection is deleted


  Scenario: Delete Playbook Collection with Multiple PBs
    Given Navigate to page "/playbooks/collections"
    Given Verify User Navigated to Playbooks
    When Import Playbook Collection with multiple PBs
    Then Verify imported Playbook Collection has multiple PBs
    When Expand navigation
    When Search Playbook Collection with multiple PBs
    When Select Multiple Playbook Collection
    Then Delete button is displayed
    When Click Delete button
    Then Verify Visible text
      | Text Type    | Text to Search              | Tag  |
      | Popup Header | Confirm Collection Deletion | span |
    When Click "Permanently Delete" button
    Then Verify Delete toaster message
    When Navigate to page "/playbooks/collections"
    Then Verify Playbook Collection with multiple PBs is deleted


  Scenario: Create child playbook
    Given Verify execution of below scenarios is successful
      | Edit Playbook Collection name |
    Given Navigate to page "/playbooks/collections"
    Given Verify User Navigated to Playbooks
    When Search Playbook Collection to Edit
      | Updated_collection |
    When Select specific playbook collection
      | Updated_collection |

    When Add Playbook button is displayed
    When Click Add Playbook
    Then Verify Playbooks creation form is displayed
    When Enter child playbook details
    Then Verify Playbook Create button is enabled
    When Click Create Playbook button
    Then Verify child playbook creation page is displayed
    When Click on Referenced Trigger
    Then Verify Referenced trigger step details page is displayed
    When Click Step Save button
    Then Verify Referenced Trigger Step is added
    When Drag step connector point
    Then Verify Steps are displayed
    When Click Create Record step
    Then Verify Create Record step details page is displayed
    When Enter Create Record step details
    When Click Step Save button
    Then Verify Create Record Step is added
    When Click Active button
    Then Verify Inactive button is visible
    When Save Playbook button is enabled
    Then Verify Click Save Playbook
    Then Verify Playbook save Toaster message
    When Verify child playbook creation page is displayed
    When Click Collections
    Then Verify User Navigated to Playbooks



  Scenario: Edit Playbook by adding new Step
    Given Verify execution of below scenarios is successful
      | Create new Playbook |
    Given Navigate to page "/playbooks/collections"
    Given Verify User Navigated to Playbooks
    When Clear Playbook Collection Search field
    When Search Playbook Collection to Edit
      | Updated_collection |
    Then Verify Searched Playbook Collection is diplayed
    When Search playbook in collection
      | Playbook |
    When Select searched Playbook
    Then Verify selected playbook is opened
    #When Drag new step connector point
    When Drag new step from existing step "Create Record"
    Then Verify Steps are displayed
    When Select Reference a Playbook step
    Then Verify Reference Playbook step fields are displayed
    When Enter Step Name
    When Select child playbook
    When Click Step Save button
    Then Verify Reference Playbook step is added
    When Save Playbook button is enabled
    Then Verify Click Save Playbook
    Then Verify Playbook save Toaster message
    Then Verify Reference Playbook step is added


  Scenario: Execute playbook and check execution logs of failed playbook
    Given Verify execution of below scenarios is successful
      | Create new Playbook |
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click Add record button
    And Add record details
      | Name                                |
      | AlertCreatedForFailedPBVerification |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForFailedPBVerification". |
    And Wait for specified time
      | 3 |
    When Click Execute Button
    Then Verify playbooks list opens
    When Enter Playbook Trigger name in searchbox
    Then Verify playbook trigger name is visible in the list
    When Click playbook trigger name
    Then Verify playbook trigger toaster message appears
    When Click executed playbook logs
    Then Search playbook in executed logs
      | Playbook |
    Then Verify playbook execution has failed
    Then Verify playbook failure error message


  Scenario: Activate child playbook
    Given Verify execution of below scenarios is successful
      | Create child playbook |
    Given Navigate to page "/playbooks/collections"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Playbooks      | span |
    Then Verify specific playbook collection name is present in list
      | Updated_collection |
    When Select specific playbook collection
      | Updated_collection |
    Then Add Playbook button is displayed
    When Search playbook in collection
      | Auto_Child_PB |
    When Select "Playbook" record at row "1"
    Then Verify Activate Button is visible
    When Click Activate Button
    Then Verify Playbook Activated Toaster message
@dev
  Scenario: Create playbook reference block
    Given Import Playbook Collection "Automation_Reference_block_playbook_testing.json"
    And Navigate to page "/playbooks/collections"
    And Search playbook collection "Automation_Reference_block_playbook_testing"
    And Click playbook collection "Automation_Reference_block_playbook_testing"
    And Filter grid column "Name" by entering "Reference_Block_Create_task_and_updated_task_status" in column level search box filter
    And Click grid cell with text "Reference_Block_Create_task_and_updated_task_status"
    And Create playbook block from source step "Create task" to target step "Update task"
      | Name          | Description                                 |
      | UI_Auto_Block | Block_For_Creating_And_Updating_Task_Status |
    And Click button "Save Playbook"
    And Verify toaster message appears
    |Playbook saved|
    And Verify Visible text
      | Text Type    | Text to Search |
      | Block header | UI_Auto_Block  |
  And Mouse hover playbook block "UI_Auto_Block"
  And Click "button" "SaveAReferenceBlock" on "Edit Playbook Page"

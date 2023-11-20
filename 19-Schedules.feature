@Regression
Feature: Schedules


   @Sanity
   Scenario: Create New Schedules
     Given Verify execution of below scenarios is successful
       | Create new Playbook |
     When Navigate to page "/schedules"
     Then Verify User Navigated to Schedules
     When Click On Create New Schedule Button
     Then Verify Schedules Form Page Displayed
     Then Verify Start Schedule checkbox is unchecked
     Then Verify No Playbook is Selected
     Then Verify No Time Zone is Selected
     Then Verify Default Cron Expression is selected
     When Enter Schedules details
     When Click Save Button
     Then Verify Toaster message is displayed
     When Click "Close" button
     Then Verify Schedule Name displayed on Grid
     Then Verify Schedule Scheduled for every one minute
     Then Verify Timezone Asia/Kolkata is displayed on Grid
     Then Verify Schedule Status set Inactive
     Then Verify Schedule Actions buttons displayed on Grid

   @Sanity
  Scenario: Start Schedule
    Given Verify execution of below scenarios is successful
      | Create New Schedules |
     When Navigate to page "/schedules"
    When Click Start Schedule Button
    Then Verify Start schedule Toaster Message is displayed
    Then Verify Schedule Status Set as Active
    Then Verify Schedule Stop button is Visible
    Then Verify Scheduled Playbook in Playbook Execution Logs
    When Navigate to page "/modules/alerts"
    Then Verify Alert record get created

   @Sanity
  Scenario: Started Schedule Displayed when Filter is Set as Active
    Given Verify execution of below scenarios is successful
      | Start Schedule |
     When Navigate to page "/schedules"
    When "By Status" Filter is Set to "Inactive"
    Then Verify "Active" Schedule is not present
    When "By Status" Filter is Set to "Active"
    Then Verify "Active" Schedule is present

   @Sanity
  Scenario: Stop Schedule
    Given Verify execution of below scenarios is successful
      | Start Schedule |
    When "By Status" Filter is Set to "All"
    Then Search for Started Schedule "Schedule_Playbook_Create_Alerts"
    When Click Stop Schedule Button
    Then Verify Stop schedule Toaster Message is displayed
    Then Verify Schedule Status set Inactive
    Then Verify Schedule Start button is displayed

   @Sanity
  Scenario: Stopped Schedule Displayed when Filter is Set as InActive
    Given Verify execution of below scenarios is successful
      | Stop Schedule |
    When "By Status" Filter is Set to "Active"
    Then Verify "InActive" Schedule is not present
    When "By Status" Filter is Set to "Inactive"
    Then Verify "InActive" Schedule is present

   @Sanity
  Scenario: l
    Given Verify execution of below scenarios is successful
      | Create New Schedules |
     When Navigate to page "/schedules"
    When "By Status" Filter is Set to "All"
    When Select Schedule
    Then Verify Delete button is displayed
    When Click Delete Button
    Then Delete confirmation dialogue is displayed
    When Clicked on Confirm button
    Then Verify Delete Schedule Toaster Message Displayed
    Then Verify Schedule Deleted


 

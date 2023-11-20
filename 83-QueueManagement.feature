@Regression
Feature: Queue Management


  Scenario: Verify default queue details
    When Navigate to page "/assignment_automation/queues/"
    Then Verify grid row "Default" is present
    And Verify below grid records are present on grid
      | Name    | Description                                                | Leader   | Members | Active | Status    |
      | Default | All new alerts, incidents, and tasks default to this queue | CS Admin | 1 user  | Active | Published |


  Scenario: Create new queue and verify the created queue details
    Given Verify execution of below scenarios is successful
      | Run Import Template |
    When Navigate to page "/assignment_automation/queues/"
    When Click "Create New Queue" button
    When Enter Queue name as "Automation Testing Queue"
    When Select Module Types as "Alert"
    When Click button "+ Add"
    When Click "Next: Define Rules" button

    When Click "+ Add Rule" button
    When Enter rule name as "Automation Defined Queue Rule"
    When Click "Very High" button
    When Click "Next: Define Members" button

    When Add queue member "CS Admin"

    When Add queue member "MS Dhoni"
    When Set queue leader "MS Dhoni"
    When Click "Next: Configure User Assignment" button

    When Click queue Save and Close button
    Then Verify toaster message appears
      | The queue has been saved successfully. |
    Then Verify grid row "Automation Testing Queue" is present
    And Verify below grid records are present on grid
      | Name                     | Leader   | Members | Active | Status    |
      | Automation Testing Queue | MS Dhoni | 2 users | Active | Published |



  Scenario: Create alert and verify alert is not assigned to anyone as defined queue is set to Leave Unassigned
    #Set "Assign Random User to Unassigned Alerts" system playbook as the inactive
    Given Verify execution of below scenarios is successful
      | Create new queue and verify the created queue details |
    When Navigate to page "/modules/alerts"
    When Click on Add Alert
    Then Alert creation form is displayed
    And Add record details
      | Name                                        |
      | AlertCreatedForQueueLeaveUnassigedQueueRule |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForQueueLeaveUnassigedQueueRule". |
    Then Close Record Detail View
    When Filter grid column "Name" by entering "AlertCreatedForQueueLeaveUnassigedQueueRule" in column level search box filter
    #Verify that assigned to field is blank
    Then Verify the assigned to is ""


  Scenario: Edit queue assignment method to Assign to Queue Lead create alert and verify alert is assigned queue lead
    Given Verify execution of below scenarios is successful
      | Create new queue and verify the created queue details |
    When Navigate to page "/assignment_automation/queues/"
    When When Open the "Automation Testing Queue" queue for edit
    Then Verify Visible text
      | Text Type   | Text to Search                       | Tag |
      | Page header | Edit Queue: Automation Testing Queue | h3  |

    When Click navigation group "User Assignment"

    When Click "Assign to Queue Lead" button
    When Click queue Save and Close button
    Then Verify toaster message appears
      | The queue has been saved successfully. |
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click on Add Alert
    Then Alert creation form is displayed
    And Add record details
      | Name                                       |
      | AlertCreatedForQueueAssigedToLeadQueueRule |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForQueueAssigedToLeadQueueRule". |
    Then Close Record Detail View
    When Filter grid column "Name" by entering "AlertCreatedForQueueAssigedToLeadQueueRule" in column level search box filter
    Then Verify the assigned to is "MS Dhoni"


  Scenario: Edit queue assignment method to Round Robin create alert and verify alert is assigned queued user
    Given Verify execution of below scenarios is successful
      | Create new queue and verify the created queue details |
    When Navigate to page "/assignment_automation/queues/"
    When When Open the "Automation Testing Queue" queue for edit
    Then Verify Visible text
      | Text Type   | Text to Search                       | Tag |
      | Page header | Edit Queue: Automation Testing Queue | h3  |

    When Click navigation group "User Assignment"

    When Click "Round Robin" button
    When Click queue Save and Close button
    Then Verify toaster message appears
      | The queue has been saved successfully. |
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click on Add Alert
    Then Alert creation form is displayed
    And Add record details
      | Name                                    |
      | AlertCreatedForQueueRoundRobinQueueRule |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForQueueRoundRobinQueueRule". |
    Then Close Record Detail View
    When Filter grid column "Name" by entering "AlertCreatedForQueueRoundRobinQueueRule" in column level search box filter
    Then Verify the assigned to is "MS Dhoni, CS Admin"
    Then Alert Grid is displayed
    When Click on Add Alert
    Then Alert creation form is displayed
    And Add record details
      | Name                                     |
      | AlertCreatedForQueueRoundRobin1QueueRule |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForQueueRoundRobin1QueueRule". |
    Then Close Record Detail View
    When Filter grid column "Name" by entering "AlertCreatedForQueueRoundRobin1QueueRule" in column level search box filter
    Then Verify the assigned to is "MS Dhoni CS Admin"



  Scenario: Verify queue can be set as the inactive
    Given Verify execution of below scenarios is successful
      | Create new queue and verify the created queue details |
    When Navigate to page "/assignment_automation/queues/"
    When When Open the "Automation Testing Queue" queue for edit
    Then Verify Visible text
      | Text Type   | Text to Search                       | Tag |
      | Page header | Edit Queue: Automation Testing Queue | h3  |

    When Click Inactive button
    When Click Save and Close button
    Then Verify toaster message appears
      | The queue has been saved successfully. |

    And Verify below grid records are present on grid
      | Name                     | Status   |
      | Automation Testing Queue | Inactive |



  Scenario: Verify queue details from queue details page
    Given Verify execution of below scenarios is successful
      | Create new queue and verify the created queue details |
    When Reload the webpage
    When Navigate to page "/assignment_automation/queues/"
    When When Open the "Automation Testing Queue" queue to view details
    Then Verify Queue "Name" is "Automation Testing Queue"
    Then Verify Queue "Queue Lead" is "MS Dhoni"
    Then Verify Queue "Created By" is " CS Admin"
    Then Verify Queue "Description" is "--"
    Then Click tab "Queue Members"
    Then Verify grid row "CS" is present
    Then Verify grid row "MS" is present
    Then Close Record Detail View


  Scenario: Verify Delete queue functionality
    Given Verify execution of below scenarios is successful
      | Create new queue and verify the created queue details |
    When Click Delete button of "Automation Testing Queue" queue
    And Click "Confirm" button

    Then Verify toaster message appears
      | "Automation Testing Queue" queue deleted |
    Then Verify in grid "Automation Testing Queue" row is not present


  Scenario: Verify Assignment Field tab details of queue management settings
    When Navigate to page "/assignment_automation/queues/"
    When Click queue management setting button
    Then Verify "Alert" module "Record Assignee Field" default selected value is "Assigned To"
    When Click "Incidents" module
    Then Verify "Incidents" module "Record Assignee Field" default selected value is "Incident Lead"
    When Click "Tasks" module
    Then Verify "Tasks" module "Record Assignee Field" default selected value is "Assigned Person"


  Scenario: Verify Automatic Queue Exit Criteria tab details of queue management settings
    When Navigate to page "/assignment_automation/queues/"
    When Click queue management setting button
    When Click tab "Automatic Queue Exit Criteria"
    Then Verify "Status" record field is chosen for the "Alert" module exit criteria
    Then Verify "Alert" module exit criteria condition is "Status Equals Closed"
    When Expand queue "Incidents" tab
    Then Verify "Status" record field is chosen for the "Incident" module exit criteria
    Then Verify "Incident" module exit criteria condition is "Status Equals Resolved"
    When Expand queue "Tasks" tab
    Then Verify "Status" record field is chosen for the "Task" module exit criteria
    Then Verify "Task" module exit criteria condition is "Status Equals Completed"


  Scenario: Verify Grid Display Settings tab details of queue management settings
    When Navigate to page "/assignment_automation/queues/"
    When Click queue management setting button
    When Click tab "Grid Display Settings"
    Then Verify selected module fields value of grid display settings tab
      | ID          |
      | Name        |
      | Status      |
      | Assigned To |
      | Created On  |
    When Expand grid display "Incidents" tab
    Then Verify selected module fields value of grid display settings tab
      | ID            |
      | Name          |
      | Status        |
      | Incident Lead |
      | Created On    |
    When Expand grid display "Tasks" tab
    Then Verify selected module fields value of grid display settings tab
      | ID              |
      | Name            |
      | Status          |
      | Assigned Person |
      | Created On      |


  Scenario: Verify the user queue members details for the team ownership
    When Reload the webpage
    When Click button "Create New Queue"
    When Enter Queue name as "Automation Testing team ownership table verification"
    When Select Module Types as "Task"
    When Click button "+ Add"
    When Click "Next: Define Rules" button

    When Click "Next: Define Members" button

    When Select the record by "Teams"

    When Add the team "SOC Team"
    And Verify below grid records are present on grid
      | First Name | Last Name |
      | CS         | Admin     |


  Scenario: Verify if for a module queueable is unchecked then it is not available for selection in add queue wizard
    #Indicator module is not queueable
    When Navigate to page "/assignment_automation/queues/"
    When Click "Create New Queue" button
    When Enter Queue name as "Automation queue for Multiple Module"
    When Click "Input" "Queue_Dropdown_ModuleType" on "Create New Queue Form"
    Then "Dropdown Option" "Queue_Dropdown_ModuleValueIndicator" is not present on "Module Types Dropdown"


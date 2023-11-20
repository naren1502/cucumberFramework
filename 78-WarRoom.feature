@Regression
Feature: War Room


  Scenario: Launch war room from incident
		#Create Incident
    When Navigate to page "/modules/incidents"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Incidents      | span |

    When Click Add record button
    Then Verify Visible text
      | Text Type   | Text to Search      | Tag |
      | Form Header | Create New Incident | h3  |
    When Enter "Test Incident For WarRoom Verification" in field "Name"

    And Click "Save" button
    Then Verify toaster message appears
      | You have created "Test Incident For WarRoom Verification". |
		
		#Link Alert to the Incident
    When Correlations tab is displayed
    When Click tab "Correlations"
    When Click "Alerts " link
    When Click on Add Alert
    Then Alert form is displayed
    When Enter "Test Alert For WarRoom Verification" in field "Name"

    And Click "Create" button
    Then Verify count of Alerts in the tab
		
		#Launch war room for the incident
    When Click "Setup War Room" button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Form Header | Setup War Room | h3  |
    And Status dropdown value is set as "Draft"
    When Enter "UI Auto WarRoom" in field War Room Title

    And Click "Create" button
		#Then Verify toaster message appears
		#|"Set up War Room from Incidents" executed successfully on 1 record.|
    Then Verify Visible text
      | Text Type            | Text to Search         | Tag |
      | Incident header text | Under Investigation In | div |
		#Wait for toaster message to disappear

    When Click War Room link on incident details view
    Then Verify war room record "UI Auto WarRoom" opens
    And Verify WarRoom status is "Draft"
    When Expand Info Center panel
    And Verify Launched By value is "--"


  Scenario: Activate War Room
    Given Verify execution of below scenarios is successful
      | Launch war room from incident |
    When Click "Go Live" button
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Popup header | Go Live        | h3  |
    When Enter "https://www.google.com" in field External Collaboration Link

    And Click "Go Live" button
    Then Verify toaster message appears
      | Triggered action "Set War Room Live and Notify Responders" on 1 record. |

    And Verify WarRoom status is "Live"
    And Verify Launched By value is "CS Admin"
    And Verify Collaboration value is "https://www.google.com"


  Scenario: Assign Team and Users to war room
    Given Verify execution of below scenarios is successful
      | Activate War Room                            |
      | Run Import Template                          |
      | Verify Team Hierarchy for SOC Team and Child |
    Given Verify "SOC Team" is added under Response Team
    When Click add response team button
    Then Verify Assign Team option is visible
    When Click "Assign Team" option
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Popup header | Assign team    | h3  |
    When Click search area
    Then Verify search items list appears
    And Wait for specified time
      | 2 |
    When Click Child Team
    Then Verify "Child Team" tag appears
    When Click Save button on Assign Team popup
    Then Verify "Child Team" is added under Response Team

    When Click add response team button
    Then Verify Assign Team option is visible
    When Click "Assign User" option
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Popup header | Assign user    | h3  |
    When Click search area
    Then Verify search items list appears
    When Click Virat Kohli
    Then Verify "Virat Kohli" tag appears
    When Click Save button on Assign Team popup
    Then Verify "Virat Kohli" is added under Response Team


  Scenario: Verify task management
    Given Reload the webpage
    Given Verify Visible text
      | Text Type  | Text to Search  | Tag             |
      | Tab header | Task Management | uib-tab-heading |
    When Click tab "Task Management"
    Then Verify Visible text
      | Text Type | Text to Search | Tag  |
      | Page text | Task List      | span |
    Then Verify "Task List" count is "0"
    When Click add new task link
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Popup header | Add Task       | h3  |
    When Enter "UI Auto Task" in field "Name"

    And Click Save Task button
    Then Verify toaster message appears
      | tasks saved sucessfully! |
    Then Verify "Task List" count is "1"
    When Click "UI Auto Task" task card
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Popup header | Edit Task      | h3  |
    When Click "Priority:" picklist
    And Select "Urgent" option

    When Click status picklist
    And Select "In progress" option

    And Click Save Task button
    Then Verify toaster message appears
      | tasks updated sucessfully! |
    Then Verify "Task List" count is "0"
    Then Verify "In progress" count is "1"
		
		# Verify filters
    When Click "Priority" picklist
    And Select "Urgent" option
    When Click "Status" picklist
    And Select "In progress" option
    And Click "Apply" button

    Then Verify "In progress" count is "1"
    When Click Clear Filter link

    When Click "Priority" picklist
    And Select "High" option
    When Click "Status" picklist
    And Select "On Hold/Blocked" option
    And Click "Apply" button

    Then Verify "In progress" count is "0"
    When Click Clear Filter link


    When Click "UI Auto Task" task card
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Popup header | Edit Task      | h3  |
    When Click "Priority:" picklist
    And Select "High" option

    When Click status picklist
    And Select "On Hold/Blocked" option

    And Click Save Task button
    Then Verify toaster message appears
      | tasks updated sucessfully! |
    Then Verify "In progress" count is "0"
    Then Verify "On Hold" count is "1"

    When Click "UI Auto Task" task card
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Popup header | Edit Task      | h3  |
    When Click "Priority:" picklist
    And Select "Medium" option

    When Click status picklist
    And Select "Completed" option

    And Click Save Task button
    Then Verify toaster message appears
      | tasks updated sucessfully! |
    Then Verify "Completed" count is "1"
    Then Verify "On Hold" count is "0"


  Scenario: Add comment with Evidence tag
    Given Verify execution of below scenarios is successful
      | Verify task management |
    Given Workspace is expanded
    When Click on Add new comment
    When Add comment "UI Auto : Warroom evidence"
    When Add Tag "uiauto"
    When Add Tag "Evidence"
    When Click Send Comment
		#verify Comment
    Then Verify newly added comment is visible
		#Verify Tag
    Then Verify Visible text
      | Text Type | Text to Search | Tag  |
      | Tag       | Evidence       | span |
		#Navigate to Investigate tab and verify Evidences
    When Click tab "Investigate"
    Then Verify Visible text
      | Text Type  | Text to Search | Tag             |
      | Tab header | Evidences      | uib-tab-heading |
    When Click tab "Evidences"
    Then Verify Visible text
      | Text Type | Text to Search                 | Tag |
      | Page text | Action Logs Marked As Evidence | h5  |
    And Verify "UI Auto : Warroom evidence" comment is added in the card view
    And Verify "Evidence" tag is visible in the card view
    And Verify "uiauto" tag is visible in the card view


  Scenario: Verify Warroom artifacts
    Given Verify execution of below scenarios is successful
      | Launch war room from incident |
    When Click tab "Artifacts"
    Then Verify artifacts grid is visible

    When Click "Incidents " link
    When Filter grid column "Name" by entering "Test Incident For WarRoom Verification" in column level search box filter
		#Then Verify "Incident Lead" column is visible
    Then Verify correct record is fetched
      | ColumnName | Value                                  |
      | Name       | Test Incident For WarRoom Verification |
    When Click "Alerts " link
    When Filter grid column "Name" by entering "Test Alert For WarRoom Verification" in column level search box filter
    And Verify correct record is fetched
      | ColumnName | Value                               |
      | Name       | Test Alert For WarRoom Verification |


  Scenario: Generate warroom report
    Given Verify execution of below scenarios is successful
      | Launch war room from incident |
    Given Generate Report button is visible
    When Click "Generate Report" button
    And Wait until war room report is generated
    And Search the comment "War Room Summary Report available for download"
    Then Verify "War Room Summary Report available for download" comment is visible in collaboration panel
    When Click WarRoom Summary Report link
    Then Verify the contents of war room summary report
    When Open exported report in browser
    Then Take snapshot of exported report
    Then Navigate to FortiSOAR application


  Scenario: Verify WarRoom timeline
    Given Verify execution of below scenarios is successful
      | Generate warroom report |
    Given Click tab "Timeline"
    Then Verify "Timeline Vew" option is highlighted
    Then Verify timeline widget is visible
    Then Verify timeline endpoints are avaialble
      | Start |
      | Now   |
    Then Verify timeline events are available
      | War Room Updated                                             |
      | Playbook [Set War Room Live and Notify Responders] Triggered |
      | Incident Linked                                              |
      | War Room Created                                             |
      | Playbook [Generate War Room Report] Triggered                |
      | New Comment Added                                            |
      | Alert Linked                                                 |
      | Task Linked                                                  |
    When Search "Report" in timeline searchbox
    When Wait for specified time
      | 2 |
    Then Verify timeline events are available
      | War Room Updated                              |
      | Playbook [Generate War Room Report] Triggered |
    When Clear the searchbox
    When User Filter is Set to "me"
    Then Verify timeline events are available
      | New Comment Added                                            |
      | Task Linked                                                  |
      | Playbook [Set War Room Live and Notify Responders] Triggered |
      | Playbook [Generate War Room Report] Triggered                |
    When User Filter is Set to "Playbook"
    Then Verify timeline events are available
      | War Room Updated  |
      | Alert Linked      |
      | Incident Linked   |
      | War Room Created  |
      | New Comment Added |
    When Clear the User filter
    And Wait for specified time
      | 2 |


    When Click "Grid View" view option
    Then Verify "Grid View" option is highlighted
    Then Verify record level audit log entry
      | Title                         | Record Type | Operation | User     |
      | New comment Added to War Room | War Room    | Comment   | Playbook |


  Scenario: Expand and Collapse Info Center
    Given Verify execution of below scenarios is successful
      | Launch war room from incident |
    When Expand Info Center panel
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Panel Header | Response Team  | h4  |
    When Collapse Info Center panel
    Then Verify Visible text
      | Text Type    | Text to Search | Tag  |
      | Panel Header | Info Center    | span |
    And Wait for specified time
      | 2 |


  Scenario: Close War Room
    Given Verify execution of below scenarios is successful
      | Launch war room from incident |
    Given Expand Info Center panel
    When Set warrrom status to "Closed"
    Then Verify Closed On field is visible on Info Center panel


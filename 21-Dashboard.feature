@Regression
Feature: Dashboard

  @Sanity
  Scenario: Create New Dashboard
    When Click Dashboard Setting Button
    Then Verify Dashboard Menu is displayed
    When Click New Dashboard option
    Then Verify Create Dashboard page is displayed
    When Enter dashboard template title
    When Click Add Row Button
    Then Verify Add Widget button is enabled
    When Click Add Widget button
    Then Verify Choose Widget popup is displayed
    When Click System Monitoring widget
    Then Verify Edit System Monitoring Metrics popup is displayed
    When Enter System Monitoring Title
    When Select System Monitoring Type
    When Enter Threshold Percentage
    When Click Save Button
    Then Verify System Monitoring widget is added
    When Click Add Widget button
    Then Verify Choose Widget popup is displayed
    When Click Connector Health widget
    Then Verify Edit Connector Health popup is displayed
    When Enter Connector Health Title
    When Click Save Button
    Then Verify Connector Health widget is added
    When Click Add Widget button
    Then Verify Choose Widget popup is displayed
    When Click Card Count widget
    Then Verify Edit Card Count popup is displayed
    When Enter Card Count Title
    When Select Data Source
    Then Verify  Edit Card Count page is expanded
    When Select Group By option Escalated
    Then Verify EscalatedToIncident is displayed in count
    When Click Save Button
    Then Verify Card Count widget is added
    When Click Add Widget button
    Then Verify Choose Widget popup is displayed
    When Click Richtext widget
    Then Verify Edit Richtext Content popup is displayed
    When Enter text content
    When Click Save Button
    Then Verify Richtext widget is added
    When Click Apply Changes button
    Then Verify toaster message appears
      | Template Saved |
    Then Verify newly created dashboard loads
    Then Verify System Monitoring widget is displayed
    Then Verify Connector Health widget is displayed
    Then Verify Card Count widget is displayed
    Then Take Dashboard page snapshot


  Scenario: Verify create dashboard audit log
    Given Verify execution of below scenarios is successful
      | Create New Dashboard |
    Given Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    Then Verify audit log entry
      | Title                            | Record Type | Operation | User     |
      | Dashboard Auto_Dashboard Created | Dashboard   | Create    | CS Admin |

  @Open_Bug #0888173
  Scenario: Verify newly created dashboard loads by default
    Given Verify execution of below scenarios is successful
      | Create New Dashboard |
    Given Navigate to page "Dashboard"
    Then Verify newly created dashboard loads


  Scenario: Edit Dashboard
    Given Verify execution of below scenarios is successful
      | Create New Dashboard |
    Given Navigate to page "Dashboard"
    When Select the dashboard
      | Auto_Dashboard_TIMESTAMP |
    Then Verify newly created dashboard loads
    When Click Dashboard Setting Button
    Then Verify Edit Dashboard option is visible
    When Click Edit Dashboard
    Then Verify Edit Dashboard page is displayed
    When Click Configure Inputs button
    Then Verify Configure Inputs popup is displayed
    When Select Enable Auto Refresh checkbox
    Then Verify Time textbox appears
    When Edit auto refresh time
    When Click Add New Input Link
    Then Verify variable input form is displayed
    When Select Text Input Type
    Then Verify Text input is selected
    When Enter Text Label
    Then Verify variable label is updated
    Then Verify Text Identifier value appears
   #When Click Required checkbox
    When Click Add New Input Link
    Then Verify variable input form is displayed
    When Select Number Input Type
    Then Verify Number input is selected
    When Enter Number Label
    Then Verify Number Identifier value appears
    When Enter default number parameter value
    When Click Add New Input Link
    Then Verify variable input form is displayed
    When Select Date Input Type
    Then Verify Date input is selected
    When Enter Date Label
    Then Verify Date Identifier value appears
    When Click Add New Input Link
    Then Verify variable input form is displayed
    When Select Date Range Input Type
    Then Verify Date Range input is selected
    When Enter Date Range Label
    Then Verify Date Range Identifier value appears
    When Click Add New Input Link
    Then Verify variable input form is displayed
    When Select Picklist Input Type
    Then Verify Picklist input is selected
    When Select input picklist
    Then Verify the picklist name is selected
    When Enter Picklist Label
    Then Verify variable label is updated
    Then Verify Picklist Identifier value appears
    When Click Add New Input Link
    Then Verify variable input form is displayed
    When Select Lookup Input Type
    Then Verify Lookup input is selected
    When Select the module
    Then Verify the module name is selected
    When Enter Lookup Label
    Then Verify variable label is updated
    Then Verify Lookup Identifier value appears
    When Click Save Variables button
    Then Verify Edit Dashboard page is displayed
    When Click Insert Row Above link
    Then Verify a new row is added
    When Click Add Widget button
    Then Verify Choose Widget popup is displayed
    When Click Richtext widget
    Then Verify Edit Richtext Content popup is displayed
    When Enter text content with dynamic variables
    When Click Save Button
    Then Verify Richtext widget is added
    When Click Apply Changes button
    Then Verify toaster message appears
      | Template Saved! |
    When Click Input button
    Then Verify Configure Dashboard Input form opens
    Then Verify Number input has default value populated
    When Enter text input
    When Enter number input
    When Enter date input
    When Select date range input
    When Select picklist input
    When Select lookup input
    When Click Ok button on Configure Input form
    Then Verify newly created dashboard loads
    Then Take Edited Dashboard page snapshot
    Then Verify input variables are correctly loaded
    Then Verify dashboard is auto refreshed after one minute


  Scenario: Verify edit dashboard audit log
    Given Verify execution of below scenarios is successful
      | Edit Dashboard |
    Given Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    Then Verify audit log entry
      | Title                            | Record Type | Operation | User     |
      | Dashboard Auto_Dashboard Updated | Dashboard   | Update    | CS Admin |


  Scenario: Verify Set as default functionality
    Given Verify execution of below scenarios is successful
      | Create New Dashboard |
    Given Navigate to page "Dashboard"
    When Select the dashboard
      | Auto_Dashboard_TIMESTAMP |
    Then Verify newly created dashboard loads
    When Click Dashboard Setting Button
    Then Verify set as default option is visible
    When Click set as default option
    Then Verify default dashboard toaster message appears
    When Navigate to page "/logout"
    Then Login to FortiSOAR
      | Username | Password     |
      | csadmin  | UserPassword |
    Then Verify default dashboard loads
      | Auto_Dashboard_TIME_STAMP |


  Scenario: Assign Roles to Dashboard
    Given Verify execution of below scenarios is successful
      | Edit Dashboard                                   |
      | Create User and Assign SOC Team,SOC Analyst Role |
    Given Verify newly created dashboard loads
    When Click Dashboard Setting Button
    Then Verify Assign Dashboard to Role option is visible
    When Click Assign Dashboard to Role option
    Then Verify Assign to Roles popup appears
    When Verify SOC Analyst checkbox is unchecked
    Then Click SOC Analyst checkbox
    When Verify SOC Analyst checkbox is checked
    When Click Ok button
    Then Verify dashboard assigned to role SOC Analyst is visible
    When Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    Then Verify below grid records are present on grid
      | Title               | Record Type | Operation | User     |
      | Linked to Dashboard | Dashboard   | Link      | CS Admin |
    When Navigate to page "/logout"
    Then Login to FortiSOAR
      | Username       | Password  |
      | userTIME_STAMP | Demo@1234 |
    Then Verify dashboard is visible to the user
    When Navigate to page "/logout"
    And Login to FortiSOAR
      | Username | Password     |
      | csadmin  | UserPassword |
    When Click Dashboard Setting Button
    Then Verify Assign Dashboard to Role option is visible
    When Click Assign Dashboard to Role option
    Then Verify Assign to Roles popup appears
    When Verify SOC Analyst checkbox is checked
    Then Click SOC Analyst checkbox
    Then Verify SOC Analyst checkbox is unchecked
    When Click Ok button
    Then Verify dashboard assigned to role none is visible
    When Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    Then Verify audit log entry
      | Title                        | Record Type | Operation | User     |
      | Role Unlinked from Dashboard | Dashboard   | Unlink    | CS Admin |
    When Navigate to page "/logout"
    Then Login to FortiSOAR
      | Username       | Password  |
      | userTIME_STAMP | Demo@1234 |
    Then Verify dashboard is not visible to the user
    
  Scenario: Clone Dashboard
    Given Verify execution of below scenarios is successful
      | Edit Dashboard |
    When Navigate to page "/logout"
    Then Login to FortiSOAR
      | Username | Password     |
      | csadmin  | UserPassword |
    Given Navigate to page "Dashboard"
    When Click Dashboard Setting Button
    Then Verify Clone Dashboard option is visible
    When Click Clone Dashboard option
    Then Verify Edit Dashboard page is displayed
    Then Verify cloned dashboard title
    When Click Apply Changes button
    Then Verify cloned dashboard loads
    When Click Input button
    Then Verify Configure Dashboard Input form opens
    Then Verify Number input has default value populated
    When Enter text input
    When Enter number input
    When Enter date input
    When Select date range input
    When Select picklist input
    When Select lookup input
    When Click Ok button on Configure Input form
    Then Verify cloned dashboard loads
    Then Take Cloned Dashboard page snapshot
    Then Verify input variables are correctly loaded
    Then Verify dashboard is auto refreshed after one minute


  Scenario: Verify clone dashboard audit log
    Given Verify execution of below scenarios is successful
      | Clone Dashboard |
    Given Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    Then Verify audit log entry
      | Title                                    | Record Type | Operation | User     |
      | Dashboard cloned: Auto_Dashboard Created | Dashboard   | Create    | CS Admin |


  Scenario: Export Dashboard Template
    Given Verify execution of below scenarios is successful
      | Clone Dashboard |
    Given Navigate to page "Dashboard"
    When Select the dashboard
      | cloned: Auto_Dashboard_TIMESTAMP |
    When Click Dashboard Setting Button
    Then Verify Export Dashboard option is visible
    When Click Export Dashboard option
    Then Verify dashboard template is exported


  Scenario: Delete Dashboard
    Given Verify execution of below scenarios is successful
      | Clone Dashboard |
    Given Navigate to page "Dashboard"
    When Select the dashboard
      | cloned: Auto_Dashboard_TIMESTAMP |
    Given Verify cloned dashboard loads
    When Click Dashboard Setting Button
    Then Verify Delete Dashboard option is visible
    When Click Delete Dashboard option
    Then Delete confirmation dialogue is displayed
    When Clicked on Confirm button
    Then Verify delete dashboard toaster message appears
    Then Verify cloned dashboard is not listed in the library


  Scenario: Verify delete dashboard audit log
    Given Verify execution of below scenarios is successful
      | Delete Dashboard |
    Given Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    Then Verify audit log entry
      | Title                            | Record Type | Operation | User     |
      | Dashboard Auto_Dashboard Deleted | Dashboard   | Delete    | CS Admin |


  Scenario: Import Dashboard Template
    Given Navigate to page "Dashboard"
    When Click Dashboard Setting Button
    Then Verify Import Dashboard option is visible
    When Click Import Dashboard option
    When Import dashboard template
    Then Verify cloned dashboard loads
    When Click Input button
    Then Verify Configure Dashboard Input form opens
   	#Then Verify OK button is disabled
   	#Then Verify mandatory asterisk is visible for text input
    Then Verify Number input has default value populated
    When Enter text input
    When Enter number input
    When Enter date input
    When Select date range input
    When Select picklist input
    When Select lookup input
    When Click Ok button on Configure Input form
    Then Verify cloned dashboard loads
    Then Take Cloned Dashboard page snapshot
    Then Verify input variables are correctly loaded
    Then Verify dashboard is auto refreshed after one minute


  Scenario: Verify import dashboard audit log
    Given Verify execution of below scenarios is successful
      | Import Dashboard Template |
    Given Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    Then Verify audit log entry
      | Title                            | Record Type | Operation | User     |
      | Dashboard Auto_Dashboard Created | Dashboard   | Create    | CS Admin |
    When Expand navigation
    When Click Dashboard link


  Scenario: Dashboard edit by SOC analyst user
    Given Verify execution of below scenarios is successful
      | Edit Dashboard                                   |
      | Create User and Assign SOC Team,SOC Analyst Role |
      | Assign Roles to Dashboard                        |
    Given Navigate to page "Dashboard"
    When Click Dashboard Setting Button
    Then Verify Assign Dashboard to Role option is visible
    When Click Assign Dashboard to Role option
    Then Verify Assign to Roles popup appears
    When Verify SOC Analyst checkbox is unchecked
    Then Click SOC Analyst checkbox
    When Verify SOC Analyst checkbox is checked
    When Click Ok button
    Then Verify dashboard assigned to role SOC Analyst is visible
    When Navigate to page "/logout"
    Then Login to FortiSOAR
      | Username       | Password  |
      | userTIME_STAMP | Demo@1234 |
    Then Verify dashboard is visible to the user
    When Select the dashboard
      | Auto_Dashboard_TIMESTAMP |
    When Click Dashboard Setting Button
    Then Verify Edit Dashboard option is visible
    When Click Edit Dashboard
    Then Verify Edit Dashboard page is displayed
    When Click Insert Row Above link
    Then Verify a new row is added
    When Click Add Widget button
    Then Verify Choose Widget popup is displayed
    When Click Richtext widget
    Then Verify Edit Richtext Content popup is displayed
    When Enter text content with user and role details
    When Click Save Button
    Then Verify Richtext widget is added
    When Click Apply Changes button
    When Click Input button
    Then Verify Configure Dashboard Input form opens
   	#Then Verify OK button is disabled
   	#Then Verify mandatory asterisk is visible for text input
    Then Verify Number input has default value populated
    When Enter text input
    When Click Ok button on Configure Input form
    Then Verify edited dashboard loads
    Then Verify newly added richtext widget is displayed
    When Click Dashboard selection list
    Then Verify two entries of dashboard are present
      | Auto_Dashboard_TIMESTAMP |
    When Custom User Logout
    Then Login to FortiSOAR
      | Username | Password     |
      | csadmin  | UserPassword |
    When Click Input button
    Then Verify Configure Dashboard Input form opens
   	#Then Verify OK button is disabled
   	#Then Verify mandatory asterisk is visible for text input
    Then Verify Number input has default value populated
    When Enter text input
    When Click Ok button on Configure Input form
    Then Verify richtext widget added by T1 user is not visible
    When Click Dashboard selection list
    Then Verify single entry of dashboard are present
      | Auto_Dashboard_TIMESTAMP |


  Scenario: Dashboard - Edit template for collapsible widget
    Given Verify execution of below scenarios is successful
      | Dashboard edit by SOC analyst user |
    Given Navigate to page "Dashboard"
    When Click Dashboard Setting Button
    Then Verify Edit Dashboard option is visible
    When Click Edit Dashboard
    When Click Add Row Button
    Then Verify Add Widget button is enabled
    When Click Add Widget button
    Then Verify Choose Widget popup is displayed
    When Click User Tile widget
    Then Verify Edit User Tile Config popup is displayed
    When Enter User Tile Widget Title
    When Select Avatar User
    When Add "Alerts" Record Modules
    When Click Save Button
    Then Verify User Tile Collapsible Button is displayed
    Then Click User Tile Collapsible Button
    When Enter Text Visible When Collapsed
    When Click Apply Changes button
    Then Verify Collapsible Button is displayed
    When Click Collapsible Button
    Then Verify Collapse keyword is visible


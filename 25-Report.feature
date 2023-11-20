@Regression
Feature: Report


  Scenario: Create New Report
    When Navigate to page "reporting/library"
    Then Verify Reporting Page is displayed
    When Click New Report button
    Then Verify Create Report page is displayed
    When Enter report template title
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
    Then Verify new report is created
    When Click View Report button
    Then Verify newly created report loads
    Then Verify System Monitoring widget is displayed
    Then Verify Connector Health widget is displayed
    Then Verify Card Count widget is displayed
    Then Take Report page snapshot


  Scenario: Verify create report audit log
    Given Verify execution of below scenarios is successful
      | Create New Report |
    Given Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    Then Verify audit log entry
      | Title                      | Record Type | Operation | User     |
      | Report Auto_Report Created | Report      | Create    | CS Admin |



  Scenario: Edit Report
    Given Verify execution of below scenarios is successful
      | Create New Report |
    Given Navigate to page "/reporting/library"
    Then Verify Reporting Page is displayed
    When Click View Report button
    Given Verify newly created report loads
    When Click Report Settings button
    Then Verify Edit Report option is visible
    When click Edit Report
    Then Verify Edit Report page is displayed
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
    When Click Required checkbox
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
    Then Verify Edit Report page is displayed

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

    Then Verify Configure Report Input form opens
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
    Then Verify newly created report loads
    Then Take Edited Report page snapshot
    Then Verify input variables are correctly loaded
    Then Verify report is auto refreshed after one minute


  Scenario: Verify edit report audit log
    Given Verify execution of below scenarios is successful
      | Edit Report |
    Given Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    Then Verify audit log entry
      | Title                      | Record Type | Operation | User     |
      | Report Auto_Report Updated | Report      | Update    | CS Admin |


  Scenario: Clone Report
    Given Verify execution of below scenarios is successful
      | Edit Report |
    Given Navigate to page "/reporting/library"
    Then Verify Reporting Page is displayed
    When Click View Report button
    Given Verify newly created report loads
    When Click Back To Library button
    Then Verify Reporting Page is displayed
    When Click Report Settings icon
    Then Verify Clone Template option is visible
    When Click Clone Template option
    Then Verify Edit Report page is displayed
    Then Verify cloned template title
    When Click Apply Changes button
    Then Verify Reporting Page is displayed
    Then Verify cloned report is listed in the library
    When Click View Report button for cloned report

    Then Verify Configure Report Input form opens
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
    Then Verify cloned report loads
    Then Take Edited Report page snapshot
    Then Verify input variables are correctly loaded
    Then Verify report is auto refreshed after one minute
    When Click Back To Library button


  Scenario: Verify clone report audit log
    Given Verify execution of below scenarios is successful
      | Clone Report |
    Given Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    Then Verify audit log entry
      | Title                              | Record Type | Operation | User     |
      | Report cloned: Auto_Report Created | Report      | Create    | CS Admin |


  Scenario: Export Report Template
    Given Verify execution of below scenarios is successful
      | Clone Report |
    Given Navigate to page "/reporting/library"
    Given Verify Reporting Page is displayed
    When Click Report Settings icon on cloned report
    Then Verify Export Template option is visible
    When Click Export Template option
    Then Verify report template is exported


  Scenario: Delete Report
    Given Verify execution of below scenarios is successful
      | Clone Report |
    Given Navigate to page "/reporting/library"
    Given Verify Reporting Page is displayed
    When Click Report Settings icon on cloned report
    Then Verify Remove Template option is visible
    When Click Remove Template option
    Then Delete confirmation dialogue is displayed
    When Clicked on Confirm button
    Then Verify delete report toaster message appears
    Then Verify cloned report is not listed in the library


  Scenario: Verify delete report audit log
    Given Verify execution of below scenarios is successful
      | Delete Report |
    Given Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    Then Verify audit log entry
      | Title                      | Record Type | Operation | User     |
      | Report Auto_Report Deleted | Report      | Delete    | CS Admin |


  Scenario: Import Report Template
    Given Navigate to page "/reporting/library"
    Given Verify Reporting Page is displayed
    Then Verify Import Report button is visible
    When Move report template to JSON files folder
    When Import report template
    When Click refresh button
    Then Verify cloned report is listed in the library
    When Click View Report button for cloned report

    Then Verify Configure Report Input form opens
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
    Then Verify cloned report loads
    Then Take Edited Report page snapshot
    Then Verify input variables are correctly loaded
    Then Verify report is auto refreshed after one minute
    When Click Back To Library button


  Scenario: Verify import report audit log
    Given Verify execution of below scenarios is successful
      | Import Report Template |
    Given Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    Then Verify audit log entry
      | Title                      | Record Type | Operation | User     |
      | Report Auto_Report Created | Report      | Create    | CS Admin |


  Scenario: Assign Roles to Report
    Given Verify execution of below scenarios is successful
      | Edit Report                                 |
      | Admin changes/reset the new user's password |
    Given Navigate to page "/reporting/library"
    Given Verify Reporting Page is displayed
    When Click Report Settings icon
    Then Verify Assign to Role option is visible
    When Click Assign to Role option
    Then Verify Assign to Roles popup appears
    When Verify SOC Analyst checkbox is unchecked
    Then Click SOC Analyst checkbox
    When Click Ok button
    And Reload the webpage
    Then Verify report assigned to role SOC Analyst is visible
    #Check if soc analyst user is able to see the assigned report
    When Admin User Logout
    When  Enter New User Username
    When  Enter New User Password
    When  Click Login Button
    Then  Verify the user is logged in
    When Navigate to Reports page
    Then Verify Reporting Page is displayed
    Then Verify report is visible to the user
    When Custom User Logout


  Scenario: Remove assigned roles from report
    Given Verify execution of below scenarios is successful
      | Assign Roles to Report |
    When Login to FortiSOAR
      | Username | Password     |
      | csadmin  | UserPassword |
    When Navigate to page "/reporting/library"
    Then Verify Reporting Page is displayed
    When Click Report Settings icon
    Then Verify Assign to Role option is visible
    When Click Assign to Role option
    Then Verify Assign to Roles popup appears
    When Verify SOC Analyst checkbox is checked
    Then Click SOC Analyst checkbox
    When Click Ok button
    And Reload the webpage
    Then Verify report assigned to role none is visible
    #Check if report is no longer visible to soc analyst user
    When Admin User Logout
    When  Enter New User Username
    When  Enter New User Password
    When  Click Login Button
    Then  Verify the user is logged in
    When Navigate to page "/reporting/library"
    Then Verify Reporting Page is displayed
    Then Verify report is not visible to the user


  Scenario: Schedule Report
    Given Verify execution of below scenarios is successful
      | Edit Report |
    Given Navigate to page "/logout/"
    When Login to FortiSOAR
      | Username | Password     |
      | csadmin  | UserPassword |
    Given Navigate to page "/reporting/library"
    Given Verify Reporting Page is displayed
    When Click Report Settings icon
    Then Verify Schedule Report option is visible
    When Click Schedule Report option

    Then Verify Schedules Form Page Displayed
    Then Verify Start Schedule checkbox is unchecked
    Then Verify No Playbook is Selected
    Then Verify No Time Zone is Selected
    Then Verify Default Cron Expression is selected
   
   #Then Verify mandatory asterisk is visible for text input
    Then Verify Number input field has default value populated
    When Enter text input value
    When Enter number input value
    When Enter date input value
    When Select date range input value
    When Select picklist input value
    When Select lookup input value
    When Enter schedule properties

    When Click Save Variables button
    Then Verify report schedule is created

    When Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    Then Verify audit log entry
      | Title                                 | Record Type | Operation | User     |
      | Schedule Auto_Report_Schedule Created | Schedule    | Create    | CS Admin |
    When Navigate to page "/reporting/library"
    Then Verify Reporting Page is displayed

    When Click Schedules tab
    Then Verify Report Schedules page is loaded
    Then Verify Report Schedule name appears in the list
    Then Verify Schedule state is Active
    Then Verify schedule frequency is Every Minute
    When Click stop schedule button
    Then Delete confirmation dialogue is displayed
    When Clicked on Confirm button
    Then Verify Start Schedule button is visible
    When Click History tab
    Then Verify Report History page is loaded
    Then Verify Report Name in History grid
    Then Verify download link for scheduled report is visible


  Scenario: Export Report
    Given Verify execution of below scenarios is successful
      | Edit Report |
    Given Navigate to page "/reporting/library"
    Given Library tab is visible
    When Click Library tab
    Then Verify Reporting Page is displayed
    When Click View Report button
    Then Verify Configure Report Input form opens
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
    Then Verify newly created report loads
    Then Verify Export as PDF button is visible
    When Click Export as PDF button
    Then Verify Exporting text is visible on button
    Then Verify Export as PDF button is visible
    Then Verify the contents of exported report
    When Open exported report in browser
    Then Take snapshot of exported report
    Then Navigate to FortiSOAR application


  Scenario: Verify export report audit log
    Given Verify execution of below scenarios is successful
      | Export Report |
    Given Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    Then Verify audit log entry
      | Title                | Record Type  | Operation | User     |
      | Saved Report Created | Saved Report | Create    | CS Admin |


  Scenario: Verify pagination on library tab

    Given Navigate to page "/reporting/library"
    Given Verify Reporting Page is displayed
    Given Get the total number of reports
    When Verify items per page value
      | 10 |
    Then Verify total available pages
    Then Verify all pages are visible with number links
    Then Verify all pages are visible with arrow links
    When Update items per page value
      | 5 |
    When Verify items per page value
      | 5 |
    Then Verify total available pages
    Then Verify all pages are visible with number links
    Then Verify all pages are visible with arrow links


  Scenario: Verify report search across pagination
    Given Navigate to page "/reporting/library"
    Given Verify Reporting Page is displayed
    When Verify items per page value
      | 5 |
    Then Navigate to last available page
    When Search report by report name
    Then Verify report is visible to the user
    When Click View Report button
    Then Verify newly created report loads
    When Click Back To Library button
    Then Verify Reporting Page is displayed

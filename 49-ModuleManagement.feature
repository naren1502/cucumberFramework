@Regression
Feature: Module Management


  Scenario: Link module from correlations tab in module record detail view
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click on Add Alert
    And Add record details
      | Name                            |
      | Alert Created For Linked Record |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "Alert Created For Linked Record |
    When Click tab "Alert Details"
    Then Verify Correlations tab is displayed
    Then Verify Incidents tab is displayed
    When Click "Incidents" under "Correlations" tab of relationship widget
    When Click add incident button
    And Add record details
      | Name                           |
      | Incident Created To Link Alert |
    And Verify "Create" Button is Enabled
    And Click "Create" button
    When Click "Incidents" under "Correlations" tab of relationship widget
    Then Verify Visible text
      | Text Type     | Text to Search                 | Tag |
      | Incident Name | Incident Created To Link Alert | *   |


  Scenario: Unlink module from correlations tab
    Given Verify execution of below scenarios is successful
      | Link module from correlations tab in module record detail view |
    When Select record to unlink
    Then Click "Remove Link" button
    Then verify Confirmation pop up comes
    Then Click "Confirm" button
    Then Verify toaster message appears
      | Selected incidents unlinked successfully. |


  Scenario: Verify functionality of playbooks tab on record detail page
    Given Verify execution of below scenarios is successful
      | Link module from correlations tab in module record detail view |
    And Exlude playbook with "system" tags in logs for all users globally
    And Allow individual playbook level logging settings to override global settings
    When Import Playbook Collection "Manual_Trigger_On_Alert.json"
    When Navigate to page "/modules/alerts"
    And Reload the webpage
    Then Alert Grid is displayed
    When Filter grid column "Name" by entering "Alert Created For Linked Record" in column level search box filter
    Then Click row "1" of grid
    Then Click Execute Button
    Then Verify Search Playbook field displayed
    Then Verify Playbook is available for execution
      | Manual Trigger - Set Variable |

    When Select Playbook from execution window
      | Manual Trigger - Set Variable |

    Then Verify Playbook execution toaster message
    When Click tab "Playbooks"
    Then Verify "Playbooks" tab is highlighted
    Then Verify Executed Playbook Logs "Current Record" is selected
    Then Verify Visible text
      | Text Type     | Text to Search                | Tag |
      | Playbook Name | Manual Trigger - Set Variable | h4  |
    Then Verify Status of the Executed playbook is passed
    Then Verify Visible text
      | Text Type               | Text to Search | Tag   |
      | Playbook Execution Time | Execution Time | label |
    Then Verify Visible text
      | Text Type                  | Text to Search | Tag   |
      | Playbook Executed on Label | Executed On    | label |
    Then Verify Visible text
      | Text Type                 | Text to Search | Tag  |
      | Playbook Mode Selected is | INFO           | span |
    When Click ENV button
    Then Verify Visible text
      | Text Type          | Text to Search | Tag |
      | Playbook Execution | finished       | div |
    Then Close step execution details
    When Switch Executed Playbook Logs Toggle
    Then Verify Executed Playbook Logs "All" is selected
    When Click on Tags Excluded
    Then Verify Visible text
      | Text Type   | Text to Search      | Tag |
      | Page Header | Filter Logs By Tags | h4  |
    Then Verify Mode Exclude is selected
    Then Verify "system" tag is visible
    Then Remove the tag "system"
    Then Click Save & Apply Filter button
    Then Verify invisibility of text
      | Text Type   | Text to Search      | Tag |
      | Page Header | Filter Logs By Tags | h4  |
    When Expand navigation of Logs
    Then Search playbook in executed playbook logs
      | Extract Indicators |


  Scenario: Verify last modified time is present at the top of detail view
    Given Verify execution of below scenarios is successful
      | Link module from correlations tab in module record detail view |
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed

    When Filter grid column "Name" by entering "Alert Created For Linked Record" in column level search box filter
    And Click row "1" of grid
    Given Verify Visible text
      | Text Type          | Text to Search | Tag |
      | Last Modified Date | Last Modified  | div |
    Then Get the Last Modified Date Time

    When Click severity on alerts details view
    Then Select Severity as "Critical"
    Then Verify Last Modified Date time is updated


  Scenario: Verify record level audit logs on record detail view
    Given Verify execution of below scenarios is successful
      | Verify last modified time is present at the top of detail view |
    Given Verify Visible text
      | Text Type  | Text to Search | Tag             |
      | Audit Logs | Audit Logs     | uib-tab-heading |
    When Click tab "Audit Logs"
    Then Verify "Timeline Vew" option is highlighted
    And Wait for specified time
    |3|
    Then Verify timeline endpoints are avaialble
      | Start |
      | Now   |
    Then Verify timeline events are available
      | Incident Unlinked |
      | Incident Linked   |
      | Alert Updated     |
      | Alert Created     |
    When Search "Linked" in timeline searchbox
    When Wait for specified time
      | 2 |
    Then Verify timeline events are available
      | Incident Linked |
    When Clear the searchbox
    When User Filter is Set to "me"
    Then Verify timeline events are available
      | Alert Updated     |
      | Incident Unlinked |
      | Incident Linked   |
      | Alert Created     |
    When User Filter is Set to "Playbook"
    Then Verify timeline events are available
      | Alert Updated |
    When Clear the User filter
    And Wait for specified time
      | 2 |
    When Operation Filter is Set to "Link"
    Then Verify timeline events are available
      | Incident Linked |
    When Click "Grid View" view option
    Then Verify "Grid View" option is highlighted
    When Wait for specified time
      |2|
    Then Verify Visible text
      | Text Type   | Text to Search   | Tag  |
      | Title       | Updated in Alert | span |
      | Record Type | Alert            | span |
      | Operation   | Update           | span |



  Scenario: Verify delete record functionality on record detail view
    #Navigate to Indicator page
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
    When Click Add record button
    Then Verify Visible text
      | Text Type   | Text to Search       | Tag |
      | Form Header | Create New Indicator | h3  |
    When Enter "Indicator to test the Delete functionality" in field "Value"

    And Click "Save" button
    Then Verify toaster message appears
      | You have created "Indicator to test the Delete functionality". |
    Then Verify record detail view is opened with title "Indicator to test the Delete functionality"
    And Click "Delete Record" button
    And Click "Confirm" button
    # ToDo Verify the delete record success message is displayed, as of now error msg doesnt get displayed logged bug for it
    Then Verify User Navigated to Indicators
    When Verify below grid records are not present on grid detail view
      | Value                                      |
      | Indicator to test the Delete functionality |


  Scenario: Verify export record as pdf with Save and Close option for the record view
    #Navigate to Indicator page
    When Navigate to page "/modules/indicators"
    Given Verify User Navigated to Indicators
    When Click Add record button
    Then Verify Visible text
      | Text Type   | Text to Search       | Tag |
      | Form Header | Create New Indicator | h3  |
    When Enter "Indicator_VerifyExportAsPDFFunctionality_01" in field "Value"

    And Click "Save" button
    Then Verify toaster message appears
      | You have created "Indicator_VerifyExportAsPDFFunctionality_01". |
    Then Verify record detail view is opened with title "Indicator_VerifyExportAsPDFFunctionality_01"
     #Export the record details as the PDF with save and close option with the selected field
    And Click "Export Record" button
    When Click on Export option "Export as PDF"
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Popup header | Export as PDF  | h3  |
    When Select fields to export
      | TLP     |
      | Expired |
    When Click "Export & Close" button

    Then Verify the exported PDF "Indicator_VerifyExportAsPDFFunctionality_01" file have content "Indicator_VerifyExportAsPDFFunctionality_01; TLP Amber; Expired No;"
    Then Verify Visible text
      | Text Type    | Text to Search                              | Tag |
      | Record Title | Indicator_VerifyExportAsPDFFunctionality_01 | p   |


  Scenario: Verify export record as pdf with Save option from the record view
    Given Navigate to page "/modules/indicators"
    Given Verify User Navigated to Indicators
    When Click Add record button
    Then Verify Visible text
      | Text Type   | Text to Search       | Tag |
      | Form Header | Create New Indicator | h3  |
    When Enter "Indicator_VerifyExportAsPDFFunctionality_02" in field "Value"

    And Click "Save" button
    Then Verify toaster message appears
      | You have created "Indicator_VerifyExportAsPDFFunctionality_02". |
    Then Verify Visible text
      | Text Type    | Text to Search                              | Tag  |
      | Record Title | Indicator_VerifyExportAsPDFFunctionality_02 | span |
    And Click "Export Record" button
    When Click on Export option "Export as PDF"
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Popup header | Export as PDF  | h3  |
    When Click "Export" button

    Then Verify the exported PDF "Indicator_VerifyExportAsPDFFunctionality_02" file have content "Indicator_VerifyExportAsPDFFunctionality_02"
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Popup header | Export as PDF  | h3  |


  Scenario: Verify user can download the attachment from the comment
    Given Navigate to page "/modules/indicators"
    When Click Add record button
    Then Verify Visible text
      | Text Type   | Text to Search       | Tag |
      | Form Header | Create New Indicator | h3  |
    When Enter "Indicator_DownloadAttachmenFromCommentTC" in field "Value"

    And Click "Save" button
    Then Verify toaster message appears
      | You have created "Indicator_DownloadAttachmenFromCommentTC". |
    Then Verify Visible text
      | Text Type    | Text to Search                           | Tag  |
      | Record Title | Indicator_DownloadAttachmenFromCommentTC | span |
    When Click on Collaboration panel
    Then Verify Visible text
      | Text Type                        | Text to Search | Tag |
      | Collaboration Panel Comments Tab | Comments       | a   |
    When Click "Comments" link
    Then Verify Visible text
      | Tag    | Text to Search | Tag    |
      | Button | New Comment    | button |

    When Click on Add new comment

    When Add comment "In comment attachment is added for download tc, please refer it"

    When Select Attachment

    When Click Send Comment
    Then Verify number of visible comments is 1
    Then confirm "EnvironmentVariables.properties" file is attached
    When Download the attachment "EnvironmentVariables.properties"

    Then Verify file "EnvironmentVariables.properties" is downloaded


  Scenario: Verify user can search comments by text
    Given Verify execution of below scenarios is successful
      | Verify user can download the attachment from the comment |
    Given Add comment "Comment-Search comment by text"

    When Select Attachment

    When Click Send Comment
    Then Verify number of visible comments is 2
    When Search comment by text "Comment-Search comment by text"

    Then Verify number of visible comments is 1


  Scenario: Verify global search for the comment record
    Given Verify execution of below scenarios is successful
      | Verify user can search comments by text |
    Given Navigate to page "/modules/alerts"
    Given Global Search is displayed
    Then Clear Global Search field
    When Enter "Comment-Search comment by text" text in Global Search box
    Then Verify Search Results page is displayed
    Then Verify more than 0 records are displayed
    And Select global search type dropdown as "Exact Text Search"
    Then Verify Visible text
      | Text Type | Text to Search    | Tag |
      | Link      | Exact Text Search | a   |
    Then Verify more than 0 records are displayed


  Scenario: Verify export task module record as a csv from the record details view
    When Navigate to page "/modules/tasks"
    When Click Add record button
    Then Verify Visible text
      | Text Type   | Text to Search  | Tag |
      | Form Header | Create New Task | h3  |
    When Enter "Task_VerifyExportAsCSVFunctionality_01" in field "Name"

    And Click "Save" button
    Then Verify toaster message appears
      | You have created "Task_VerifyExportAsCSVFunctionality_01". |
    Then Verify record detail view is opened with title "Task_VerifyExportAsCSVFunctionality_01"
    # Export the record details as the PDF with save and close option with the selected field
    And Click "Export Record" button
    When Click on Export option "Export as CSV"
    Then Verify file "export.csv" is downloaded

    Then Close Record Detail View
    When Navigate to page "/modules/tasks"
    When Filter grid column "Name" by entering "Task_VerifyExportAsCSVFunctionality_01" in column level search box filter
    And Verify correct record is fetched
      | ColumnName | Value                                  |
      | Name       | Task_VerifyExportAsCSVFunctionality_01 |
    When Set the downloaded task record csv file verification data
    And Verify csv file "export.csv" is downloaded with expected data


  Scenario: Verify the functionality resolve alert record from details view
    When Navigate to page "/modules/alerts"

    Then Alert Grid is displayed
    When Click on Add Alert
    And Add record details
      | Name                                                |
      | Alert created to verify alert resolve functionality |
    And Click "Save" button
    Then Verify toaster message appears
      | Alert created to verify alert resolve functionality |
    Then Wait until resolve button is visible

    And Click button "Resolve"

    When Add the alert closure comment
    And Click button "Resolve"
    When Click tab "Alert Details"
    Then Verify Visible text
      | Text Type | Text to Search     | Tag  |
      | Title     | Alert is Resolved. | span |


  Scenario: Execute Connector Actions and verify the comment is added for the action result
    Given Configure connector
      | ConnectorName | Version | ConfigName  | Key01  |
      | virustotal    | 3.0.2   | auto_config | APIKey |
    When Navigate to page "/modules/alerts"

    Then Alert Grid is displayed
    When Click on Add Alert
    And Add record details
      | Name                                    |
      | AlertCreatedForConnectorActionExecution |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForConnectorActionExecution |
    When Click Actions Button
    Then Verify Actions Window is opened
    When Search "VirusTotal" Connector in Action Window
    Then Verify "VirusTotal" Connector is Searched
    When Select "VirusTotal" Connector
    Then Verify "VirusTotal" Connector Actions are listed
      |  Submit File             |
      | Submit URL for scanning |
      | Get IP Reputation       |
      | Get URL Reputation      |
    When Wait for specified time
      |2|
    When Click Action "Get IP Reputation" for connector "VirusTotal"

    Then Verify Execute Action Window Opened
      | VirusTotal |
    When Enter the "ip" input as "8.8.8.8"
    When Click Execute Action
    Then Verify Output Tab is displayed
    Then Verify Input Tab is displayed
    Then Verify Key Value Section is displayed
    Then Verify Save Selected Output Keys Button is displayed
    When Select Output Key
    Then Save Selected Output Keys Button is enable
    When Click Save Selected Output Keys Button
    When Click on Collaboration panel
    Then Verify Visible text
      | Text Type                        | Text to Search | Tag |
      | Collaboration Panel Comments Tab | Comments       | a   |
    When Click tab "Comments"
    When Search comment by text "Get IP Reputation"

    Then Verify number of visible comments is 1
    Then Verify "Get IP Reputation" comment is visible in collaboration panel
    When Add filter tag "ActionLog"

    Then Verify number of visible comments is 1
    Then Verify "Get IP Reputation" comment is visible in collaboration panel
    When Remove applied tag filter


  Scenario: Verify the Delete record functionality from the Edit Record page
    When Navigate to page "/modules/indicators"

    When Click button "Add"
    And Enter "DeleteRecordFromEditView" in field "Value"
    #wait for save button to load properly

    And Click button "Save"
    Then Verify toaster message appears
      | You have created "DeleteRecordFromEditView" |
    Then Verify record detail view is opened with title "DeleteRecordFromEditView"
    And Click "Edit Record" button
    Then Verify Visible text
      | Text Type                | Text to Search | Tag |
      | Edit Record Wizard Title | Edit Indicator | h3  |
    And Click "Delete Record" button
    And Click "Confirm" button
    Then Verify toaster message appears
      | Indicator deleted. |


  Scenario: Add tag to the connector action and verify the comment is added with the tag
  #Execute the connector action,Add the tag to save the selected keys from output
  #Check comment is added with the specified tag value
    Given Configure connector
      | ConnectorName | Version | ConfigName  | Key01  |
      | virustotal    | 3.0.2   | auto_config | APIKey |
    When Navigate to page "/modules/alerts"

    Then Alert Grid is displayed
    When Click on Add Alert
    And Add record details
      | Name                                             |
      | AlertCreatedForConnectorActionExecutionWithTagTC |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForConnectorActionExecutionWithTagTC |
    When Click Actions Button
    Then Verify Actions Window is opened
    When Search "VirusTotal" Connector in Action Window
    Then Verify "VirusTotal" Connector is Searched
    When Select "VirusTotal" Connector
    Then Verify "VirusTotal" Connector Actions are listed
      | Submit File             |
      | Submit URL for scanning |
      | Get IP Reputation       |
      | Get URL Reputation      |
    When Wait for specified time
      |2|
    When Click Action "Get IP Reputation" for connector "VirusTotal"

    Then Verify Execute Action Window Opened
      | VirusTotal |
    When Enter the "ip" input as "8.8.8.8"
    When Click Execute Action
    Then Verify Output Tab is displayed
    Then Verify Input Tab is displayed
    Then Verify Key Value Section is displayed
    Then Verify Save Selected Output Keys Button is displayed
    When Select Output Key
    When Add Tag for connector output "ConnectorUIAutoTag"
    Then Save Selected Output Keys Button is enable
    When Click Save Selected Output Keys Button
    When Click on Collaboration panel
    Then Verify Visible text
      | Text Type                        | Text to Search | Tag |
      | Collaboration Panel Comments Tab | Comments       | a   |
    When Add filter tag "ConnectorUIAutoTag"

    Then Verify number of visible comments is 1
    Then Verify "Get IP Reputation" comment is visible in collaboration panel
    When Remove applied tag filter


  Scenario: Verify connector details on the execute Connector Action Window and close the wizard
    Given Configure connector
      | ConnectorName | Version | ConfigName  | Key01  |
      | virustotal    | 3.0.2   | auto_config | APIKey |
    When Navigate to page "/modules/alerts"

    Then Alert Grid is displayed
    When Click on Add Alert
    And Add record details
      | Name                                            |
      | AlertCreatedToVerifyConnectorActionWizardDetail |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created " | AlertCreatedToVerifyConnectorActionWizardDetail |
    When Click Actions Button
    Then Verify Actions Window is opened
    When Search "VirusTotal" Connector in Action Window
    Then Verify "VirusTotal" Connector is Searched
    When Select "VirusTotal" Connector
    Then Verify "VirusTotal" Connector Actions are listed
      | Submit File             |
      | Submit URL for scanning |
      | Get IP Reputation       |
      | Get URL Reputation      |

    When Click Action "Get IP Reputation" for connector "VirusTotal"

    Then Verify Execute Action Window Opened
      | VirusTotal |
    Then Verify Visible text
      | Text Type                 | Text to Search    | Tag  |
      | Connector Certified Title | Certified:        | span |
      | Connector Certified Value | Yes               | p    |
      | Connector Publisher Title | Publisher:        | span |
      | Connector Publisher Value | Fortinet          | span |
      | Connector Action Title    | Action            | span |
      | Connector Action Name     | Get IP Reputation | span |
    Then Verify Target Self is Selected
    And Close the connector execution wizard
    Then Verify Actions Window is opened


  Scenario: Verify Error msg is displayed for direct connector action when the connector is deactivated
    Given Change the "virustotal" connector active status as "Inactive"
    When Navigate to page "/modules/alerts"

    Then Alert Grid is displayed
    When Click on Add Alert
    And Add record details
      | Name                                          |
      | AlertCreatedForConnectorActionExecutionFailTC |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForConnectorActionExecutionFailTC |
    When Click Actions Button
    Then Verify Actions Window is opened
    When Search "VirusTotal" Connector in Action Window
    Then Verify "VirusTotal" Connector is Searched
    When Select "VirusTotal" Connector
    Then Verify "VirusTotal" Connector Actions are listed
      | Get IP Reputation |
    When Wait for specified time
      |2|
    When Click Action "Get IP Reputation" for connector "VirusTotal"

    Then Verify Execute Action Window Opened
      | VirusTotal |
    When Enter the "ip" input as "8.8.8.8"
    When Click Execute Action

    Then Verify the output has below details
      | message | CS-INTEGRATION-5: Error occurred while executing the connector action ERROR :: Connector virustotal does not exists |
      | status  | failed                                                                                                              |
      | _status | false                                                                                                               |


  Scenario: Verify the connector action output tool details
    Given Verify execution of below scenarios is successful
      | Execute Connector Actions and verify the comment is added for the action result |
    Given Change the "virustotal" connector active status as "Active"
    When Navigate to page "/modules/alerts"

    Then Alert Grid is displayed
    When Click on Add Alert
    And Add record details
      | Name                                          |
      | AlertCreatedForConnectorActionExecutionFailTC |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForConnectorActionExecutionFailTC |
    When Click Actions Button
    Then Verify Actions Window is opened
    When Search "VirusTotal" Connector in Action Window
    Then Verify "VirusTotal" Connector is Searched
    When Select "VirusTotal" Connector
    Then Verify "VirusTotal" Connector Actions are listed
      | Get IP Reputation |
    When Wait for specified time
      |2|
    When Click Action "Get IP Reputation" for connector "VirusTotal"

    Then Verify Execute Action Window Opened
      | VirusTotal |
    When Enter the "ip" input as "8.8.8.8"
    When Click Execute Action

    Then Verify the output has below details
      | type | ip_address |
      | id   | 8.8.8.8    |
    When Click button "JSON"
    When Click copy to clipboard button
    Then Verify toaster message appears
      | Copied to clipboard |
    Then Enter Search text "VX Vault" in the output

    Then Verify the search result is "2" results



  Scenario:  Create a record to verify only 10 past saved output displayed
    #Below two scenarios are depends on this scenario
    Given Configure connector
      | ConnectorName | Version | ConfigName  | Key01  |
      | virustotal    | 3.0.2   | auto_config | APIKey |
    When Navigate to page "/modules/alerts"

    Then Alert Grid is displayed
    When Click on Add Alert
    And Add record details
      | Name                                    |
      | AlertCreatedForConnectorActionExecution |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForConnectorActionExecution |


  Scenario Outline: Execute connector action 10 times and save output
    Given Verify execution of below scenarios is successful
      | Create a record to verify only 10 past saved output displayed |
    #allow action button to settle when it runs in loops
    When Wait for specified time
      |2|
    When Click Actions Button
    Then Verify Actions Window is opened
    When Search "<ConnectorName>" Connector in Action Window
    Then Verify "<ConnectorName>" Connector is Searched
    When Select "<ConnectorName>" Connector
    Then Verify "<ConnectorName>" Connector Actions are listed
      | Submit File             |
      | Submit URL for scanning |

    When Click Action "<ConnectorAction>" for connector "<ConnectorName>"

    Then Verify Execute Action Window Opened
      | VirusTotal |

    When Enter the "<InputField>" input as "<InputValue>"
    When Click Execute Action
    Then Verify Output Tab is displayed
    Then Verify Input Tab is displayed
    Then Verify Key Value Section is displayed
    Then Verify Save Selected Output Keys Button is displayed
    When Select Output Key
    Then Save Selected Output Keys Button is enable
    When Click Save Selected Output Keys Button
    Then Verify toaster message appears
      | Saved Action Log to Workspace |


    Examples:
      | ConnectorName | ConnectorAction   | InputField | InputValue |
      | VirusTotal    | Get IP Reputation | ip         | 8.8.8.8    |
      | VirusTotal    | Get IP Reputation | ip         | 8.8.8.8    |
      | VirusTotal    | Get IP Reputation | ip         | 8.8.8.8    |
      | VirusTotal    | Get IP Reputation | ip         | 8.8.8.8    |
      | VirusTotal    | Get IP Reputation | ip         | 8.8.8.8    |
      | VirusTotal    | Get IP Reputation | ip         | 8.8.8.8    |
      | VirusTotal    | Get IP Reputation | ip         | 8.8.8.8    |
      | VirusTotal    | Get IP Reputation | ip         | 8.8.8.8    |
      | VirusTotal    | Get IP Reputation | ip         | 8.8.8.8    |
      | VirusTotal    | Get IP Reputation | ip         | 8.8.8.8    |



  Scenario: Verify only 10 past saved output displayed and select input from JSON output data
    Given Verify execution of below scenarios is successful
      | Execute connector action 10 times and save output |
    #Execute the connector action and save the output as we are doing this 11th time,in earlier scenario we did it 10 times
    #Check only 10 past saved output displayed
    #User should be able to select input from JSON output data
    When Click Actions Button
    Then Verify Actions Window is opened
    When Search "VirusTotal" Connector in Action Window
    Then Verify "VirusTotal" Connector is Searched
    When Select "VirusTotal" Connector
    Then Verify "VirusTotal" Connector Actions are listed
      | Get IP Reputation  |
      | Get URL Reputation |
    When Wait for specified time
      |2|
    When Click Action "Get IP Reputation" for connector "VirusTotal"

    Then Verify Execute Action Window Opened
      | VirusTotal |
    When Click on the "ip" Input field
    When Click on link "Past Action Outputs"
    Then Verify the past action output msg displayed
    Then Verify the total "10" past action output is displayed

#   Save 11th output of the action execution
    And Close the connector execution wizard
    Then Verify Actions Window is opened
    When Wait for specified time
      |2|
    When Click Action "Get IP Reputation" for connector "VirusTotal"

    Then Verify Execute Action Window Opened
      | VirusTotal |

    When Enter the "ip" input as "8.8.8.8"
    When Click Execute Action
    Then Verify Output Tab is displayed
    Then Verify Input Tab is displayed
    Then Verify Key Value Section is displayed
    Then Verify Save Selected Output Keys Button is displayed
    When Select Output Key
    Then Save Selected Output Keys Button is enable
    When Click Save Selected Output Keys Button
    Then Verify toaster message appears
      | Saved Action Log to Workspace |


#   Verify only last 10 saved output are listed
    When Click Actions Button
    Then Verify Actions Window is opened
    When Search "VirusTotal" Connector in Action Window
    Then Verify "VirusTotal" Connector is Searched
    When Select "VirusTotal" Connector
    Then Verify "VirusTotal" Connector Actions are listed
      | Get IP Reputation  |
      | Get URL Reputation |
    When Wait for specified time
      |2|
    When Click Action "Get IP Reputation" for connector "VirusTotal"

    Then Verify Execute Action Window Opened
      | VirusTotal |
    When Click on the "ip" Input field
    When Click on link "Past Action Outputs"
    Then Verify the past action output msg displayed
    Then Verify the total "10" past action output is displayed

    # Select the specific output details in the input
    When Expand the "Get IP Reputation" action of past output container no "1"

    When Select "ARIN" from json output data as a input
    Then Verify the "ip" field have input "ARIN"


  Scenario: Verify user can select record fields details in the connector action input value
    Given Verify execution of below scenarios is successful
      | Execute Connector Actions and verify the comment is added for the action result |
    Given Navigate to page "/modules/alerts"

    When Click on Add Alert
    And Add record details
      | Name                                     | Source      |
      | Alert_ExecuteConnectorActionWithSourceIP | 10.10.10.10 |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "Alert_ExecuteConnectorActionWithSourceIP" |
    When Click Actions Button
    Then Verify Actions Window is opened
    When Search "VirusTotal" Connector in Action Window
    Then Verify "VirusTotal" Connector is Searched
    When Select "VirusTotal" Connector
    Then Verify "VirusTotal" Connector Actions are listed
      | Get IP Reputation  |
      | Get URL Reputation |
    When Wait for specified time
      |2|
    When Click Action "Get IP Reputation" for connector "VirusTotal"

    Then Verify Execute Action Window Opened
      | VirusTotal |
    When Click on the "ip" Input field
    When Select the record value of "Source" field
    Then Verify the "ip" field have input "10.10.10.10"


  Scenario: Edit the alert record details
    Given Navigate to page "/modules/alerts"
    Given Verify User Navigated to Alerts
    When Click Add record button
    Then Verify Visible text
      | Text Type   | Text to Search   | Tag |
      | Form Header | Create New Alert | h3  |
    When Enter "AlertCreatedToVerifyEdit" in field "Name"

    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedToVerifyEdit". |
    And Verify record detail view is opened with title "AlertCreatedToVerifyEdit"
    # Export the record details as the PDF with save and close option with the selected field
    And Click "Edit Record" button
    Then Verify Visible text
      | Text Type         | Text to Search | Tag |
      | Edit Alert header | Edit Alert     | h3  |
    When Enter "AlertCreatedToVerifyEdit-Functionality " in field "Name"
    When Add the description "Adding the alert description from automation through edit alert functionality"
    And Add record details
      | Source      | Tags         |
      | 10.10.10.10 | ui_auto_edit |
    Then Click button "Save"
    Then Verify toaster message appears
      | AlertCreatedToVerifyEdit-Functionality saved. |

    And Click tab "Alert Details"
    Then Verify Visible text
      | Text Type            | Text to Search                                | Tag  |
      | Alert Details Header | Alert: AlertCreatedToVerifyEdit-Functionality | span |
      | Alert Tag            | ui_auto_edit                                  | span |
      | Alert Source         | 10.10.10.10                                   | p    |
    Then Verify alert description is "Adding the alert description from automation through edit alert functionality"

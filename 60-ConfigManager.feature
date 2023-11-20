@Regression
Feature: ConfigurationManager


  Scenario: Create and Save Export Template
    When Navigate to page "/editor/exporter/templates"
    Then Verify Export Wizard page is displayed
    When Click New Export Template button
    Then Verify Configuration Export Wizard opens
    Then Verify Choose Entities option is highlighted
    Then Verify Filter Data option is inactive
    When Click Select All checkbox
    Then Verify Continue button on Choose Entities page is enabled
    When Click Continue button on Choose Entities page
    Then Verify Filter Data option is highlighted
    Then Verify Run Export option is inactive
    When Click Include Everything checkbox
    Then Verify Export All modules checkbox is selected
    Then Verify Export Records checkbox is selected
    Then Verify all entity items are selected
      | Role                   |
      | Team                   |
      | User                   |
      | System View            |
      | User                   |
      | Module                 |
      | Report                 |
      | Widget                 |
      | Administrative Setting |
      | Picklist               |
      | Global Variable        |
      | Rule                   |
      | Rule Channel           |
    When Click "Playbook Collection" tab
    When Click "Playbook Name" label
    When Click "02 - Use Cases" label
    Then Verify selected "Playbook Collection" count is "1"
    When Click "Connectors" tab
    Then Click Export All checkbox on Connectors tab
    Then Select "Code Snippet" connector export button
    Then Verify selected "Connector" count is "1"
    Then Verify Continue button on Filter Data page is enabled
    When Click Continue button on Filter Data page
    Then Verify Run Export option is highlighted
    Then Verify Review Export text is visible
    Then Verify entity count
      | Role                   |
      | Team                   |
      | User                   |
      | System View            |
      | User                   |
      | Module Schema          |
      | Report                 |
      | Widget                 |
      | Connector              |
      | Administrative Setting |
      | Picklist               |
      | Module View            |
      | Playbook Collection    |
      | Global Variable        |
      | Rule                   |
      | Rule Channel           |
    Then Verify records count
      | nonzero |
    When Enter Template Name
    Then Capture the File Name text
    When Click Save Template button
    Then Verify Export Grid Entry
      | Last Export Date |
      | NULL             |


  Scenario: Run Export Template
    Given Verify execution of below scenarios is successful
      | Create and Save Export Template |
    Given Run Export button is visible
    When Click Run Export Wizard
    Then Verify Configuration Export Wizard opens
    Then Verify Run Export option is highlighted
    Then Verify Template Name text
    When Click Save and Run Export button
    Then Verify Running export text is visible
    When Export is completed successfully
    Then Verify exported file name is populated correctly
    When Click Download File button
    Then Verify configuration file is downloaded succesfully
    Then Verify the contents in downloaded configuration file
      | Internal Folders |
      | actors           |
      | appSettings      |
      | connectors       |
      | dashboards       |
      | modules          |
      | picklists        |
      | playbooks        |
      | records          |
      | reports          |
      | roles            |
      | teams            |
      | views            |
      | widgets          |
      | rules            |
      | ruleChannels     |
    When Click Done button
    Then Verify Export Wizard page is displayed
    Then Verify Export Grid Entry
      | Last Export Date |
      | TimeStamp        |
    When Click Export History tab
    Then Verify Export History tab is selected
    Then Verify Export History grid record
      | File                    | Template Name        | Status          |
      | Configuration File Name | Export Template Name | Export Complete |


  Scenario: Export the export template
    Given Verify execution of below scenarios is successful
      | Run Export Template |
    Given Click Export Template tab
    Then Verify Export Template tab is selected
    When Select export template "Auto_FortiSOAR_Export"
    Then Verify Export button is visible
    When Click "Export" button
    Then Verify export template is downloaded
    Then Verify downloaded template file contents


  Scenario: Delete exported template
    Given Verify execution of below scenarios is successful
      | Create and Save Export Template |
    Given Navigate to page "/editor/exporter/templates"
    Given Verify Export Template tab is selected
    When Capture number of grid records
    When Click delete template button
    Then Delete confirmation dialogue is displayed
    When Clicked on Confirm button
    Then Verify toaster message appears
      | Export Template deleted |
    Then Verify template is deleted from export grid
    Then Verify number of grid records is updated


  Scenario: Run Import Template
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
      | UI_Auto_Export_01.zip |          |
    Then Verify Configurations list is visible
    Then Verify "Configurations" tab is highlighted
    Then Verify "Options" tab is not highlighted
    Then Verify select all checkbox is selected
    When Click "Continue" button
    Then Verify "Options" tab is highlighted
    When Verify entity count is correct
      | Entity                 | Count |
      | Module                 | 1     |
      | Picklist               | 6     |
      | Dashboard              | 1     |
      | Report                 | 1     |
      | Role                   | 1     |
      | Team                   | 4     |
      | User                   | 4     |
      | Administrative Setting | 1     |
      | Record Set             | 1     |
    When Click "Module" tab
    Then Verify Existing Modules count is "1"
    Then Verify table entry
      | Incidents | List View | Detail View | Add View |
    Then Verify default option is Merge With Existing
    When Click Review icon
    Then Verify table entry
      | Auto Test Field | Create |
    When Click "Picklist" tab
    Then Verify grid entry
      | DeliveryVector |
      | Severity       |
    When Click "Dashboard" tab
    Then Verify grid entry
      | Auto_Test_Dashboard_01 |
    When Click "Report" tab
    Then Verify grid entry
      | Auto_Test_Report_01 |
    When Click "Role" tab
    Then Verify grid entry
      | UI Automation Analyst |
    When Click "Team" tab
    Then Verify grid entry
      | Child Team   |
      | Parent Team  |
      | Sibling Team |
    When Click "User" tab
    Then Verify grid entry
      | MS Dhoni         |
      | Rahul Dravid     |
      | Sachin Tendulkar |
      | Virat Kohli      |
    When Click "Administrative Setting" tab
    Then Verify grid entry
      | branding |
    When Click "Record Set" tab
    Then Verify grid entry
      | Incidents |
    When Click Continue button on Options tab
    Then Verify "Run Import" tab is highlighted
    Then Verify Visible text
      | Text Type | Text to Search | Tag |
      | Page Text | Review Import  | h3  |
    Then Verify entity count
      | Role                   |
      | Team                   |
      | User                   |
      | Report                 |
      | Picklist               |
      #|Module View| Its a bug-Incorrect count 0810091
      | Module Schema          |
      | Administrative Setting |
    When Click "Run Import" button
    Then Verify Visible text
      | Text Type         | Text to Search           | Tag |
      | Dialog box header | Confirm Import & Publish | h3  |
    When Click "I have reviewed the changes - Publish" button
    Then Verify Visible text
      | Text Type | Text to Search | Tag |
      | Page Text | Running Import | h3  |
    Then Wait for Import to complete
      | Total Time | Polling Time |
      | 360        | 5            |
    When Click "Done" button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page header | Import Wizard  | h1  |
    Then Verify Import grid record
      | File                  | Status          |
      | UI_Auto_Export_01.zip | Import Complete |


      #Verification of imported configurations
  Scenario: Verify if dashboard is imported successfully
    Given Verify execution of below scenarios is successful
      | Run Import Template |
    When Navigate to page "/dashboard"
    When Select the dashboard
      | Auto_Test_Dashboard_01 |
    Then Verify record count is "5" with text "UI_Auto" in card count widget

  Scenario: Verify if reports are imported successfully
    Given Verify execution of below scenarios is successful
      | Run Import Template |
    When Navigate to page "/reporting/library"
    Then Verify Reporting Page is displayed
    When Search report by report name "Auto_Test_Report_01"
    Then Verify report "Auto_Test_Report_01" is visible to the user
    When Click View Report button for report "Auto_Test_Report_01"
    Then Verify report "Auto_Test_Report_01" loads
    Then Verify record count is "5" with text "UI_Auto" in card count widget

  Scenario: Verify if incident module changes are imported successfully
    Given Verify execution of below scenarios is successful
      | Run Import Template |
    When Navigate to page "/modules/incidents"
    Then Incident Page is displayed
    Then Verify value of "Auto Test Field" is Present on Grid View
    When Click add incident button
    Then Verify field "Auto Test Field" value is "UI_Auto"
    When Enter "Test Config Import" in field "Auto Test Field"
    When Enter "Auto Incident : Config Import" in field "Name"
    When Click "Save" button
    Then Verify record "Auto Incident : Config Import" opens
    Then Verify value of "Auto Test Field" on Record Detail as "Test Config Import"

  Scenario: Verify if team hierarchy is imported successfully
    Given Verify execution of below scenarios is successful
      | Run Import Template |
    When Navigate to page "/security/team-hierarchy"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page header | Team Hierarchy | h1  |
    When Double click SOC Team
    Then Verify SOC Team is selected for editing
    Then Verify Parent Team is set as parent of SOC Team
    Then Verify Sibling Team is set as sibling of SOC Team
    Then Verify Child Team is set as child of SOC Team

  Scenario: Verification if users are imported successfully
    Given Verify execution of below scenarios is successful
      | Run Import Template |
    When Navigate to page "/security/people"
    Then Verify Users page is displayed
    When Select user "Dhoni"
    Then Verify Edit User page is displayed
    Then Verify "Status" dropdown value is "Inactive"
    When "Status" Filter is Set to "Active"
    Then Verify "Sibling Team" is set as "Team"
    Then Verify "UI Automation Analyst" is set as "Role"
    When Click On Reset Password
    When Click New Password
    When Click Confirm Password
    When Click Submit button
    Then Verify toaster message appears
      | Password changed successfully. |
    When Click "Save" button
    Then Verify toaster message appears
      | MS Dhoni saved. |

  Scenario: Verifiy if teams are imported successfully
    Given Verify execution of below scenarios is successful
      | Run Import Template |
    When Navigate to page "/security/teams"
    Then Teams Page is displayed
    Then Verify teams grid records
      | Name         | Description         |
      | Child Team   | Child of SOC team   |
      | Parent Team  | Parent of SOC team  |
      | Sibling Team | Sibling of SOC Team |


  Scenario: Run Import Template for Connectors and Playbooks
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
      | FileName                       | FilePath |
      | UIAutoPlaybookAndConnector.zip |          |
    Then Verify Configurations list is visible
    Then Verify "Configurations" tab is highlighted
    Then Verify "Options" tab is not highlighted
    #Then Verify select all checkbox is selected bug
    When Click "Continue" button
    Then Verify "Options" tab is highlighted
    When Verify entity count is correct
      | Entity              | Count |
      | Playbook Collection | 1     |
      | Connector           | 2     |
      | Record Set          | 1     |
    When Click "Playbook Collection" tab
    Then Verify table entry
      | UI Auto Import Validation | Yes |
    When Click "Connector" tab
    Then Verify table entry
      | Fortinet FortiSIEM | Yes | Already Installed | 1 Configuration |
    And Verify table entry
      | IPStack | Yes | Install | 1 Configuration |
    When Click "Record Set" tab
    Then Verify grid entry
      | Alerts |
    When Click Continue button on Options tab
    Then Verify "Run Import" tab is highlighted
    Then Verify Visible text
      | Text Type | Text to Search | Tag |
      | Page Text | Review Import  | h3  |
    Then Verify entity count
      | Connector           |
      | Playbook Collection |
    When Click "Run Import" button
    Then Verify Visible text
      | Text Type | Text to Search | Tag |
      | Page Text | Running Import | h3  |
    Then Wait for Import to complete
      | Total Time | Polling Time |
      | 360        | 5            |
    When Click "Done" button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page header | Import Wizard  | h1  |
    Then Verify Import grid record
      | File                           | Status          |
      | UIAutoPlaybookAndConnector.zip | Import Complete |

  Scenario: Verify if connectors are imported successfully
    Given Verify execution of below scenarios is successful
      | Run Import Template for Connectors and Playbooks |
    When Navigate to page "/connectors"
    Then Verify "Manage" tab is active
    #Check if fortisiem configuration is imported successfully
    When Search by Connector Name
      | ConfigImportedConnector  |#Fortinet FortiSIEM add this
    Then Verify connector gets searched
      | ConfigImportedConnector |
    When Click on Connector
      | ConfigImportedConnector |
    Then Verify Connector detail is displayed
      | ConfigImportedConnector |
    Then Check Configuration status
      | COMPLETED |
    And Text "Available" is present in "Connector_Config_Tab_Health_Check" on "Connector Config Tab"
    #check if ipstack is installed upon import
    When Navigate to page "/content-hub/my-content/?searchText=Ipstack"
    Then Verify connector gets searched
      | IPStack |
    When Click on Connector
      | IPStack |
    Then Verify Connector detail is displayed
      | IPStack |
    Then Check Configuration status
      | COMPLETED |


  Scenario: Verify if playbooks are imported successfully
    Given Verify execution of below scenarios is successful
      | Run Import Template for Connectors and Playbooks |
    When Navigate to page "/playbooks/collections"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page header | Playbooks      | span |
    Then Verify specific playbook collection name is present in list
      |UI Auto Import Validation |
    When Select specific playbook collection
      | UI Auto Import Validation |
    Then Search playbook in collection
      | UI_Auto_Update_Alert_Severity |


  Scenario: Verify if imported playbook is executed successfully
    Given Verify execution of below scenarios is successful
      | Verify if playbooks are imported successfully |
    And Create below records for "alerts" module via api call
      | name     |
      | Alert_Created_For_Imported_Playbook_Validation |
    When Navigate to page "/modules/alerts"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page header | Alerts         | span |
    When Filter grid column "Name" by entering "Alert_Created_For_Imported_Playbook_Validation" in column level search box filter
    Then Verify grid record count is "1"
    When Click row "1" of grid
    When Click Execute Button
    Then Verify Search Playbook field displayed
    Then Verify Playbook is available for execution
      | UI_Auto_Update_Severity |
    When Execute Playbook "UI_Auto_Update_Severity" under collection "UI Auto Import Validation"
    Then Verify toaster message appears
      | Triggered action |
    #Wait for PB execution to be complete
    Then Verify alert severity is "Critical"

  Scenario: Run Import Template for Application Configurations
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
      | UI_Auto_Export_03.zip |          |
    Then Verify Configurations list is visible
    Then Verify "Configurations" tab is highlighted
    Then Verify "Options" tab is not highlighted
    Then Verify select all checkbox is selected
    When Click "Continue" button
    Then Verify "Options" tab is highlighted
    When Verify entity count is correct
      | Entity                 | Count |
      | System View            | 1     |
      | Administrative Setting | 7     |
    When Click "System View" tab
    Then Verify grid entry
      | Queue Management |
    When Click "Administrative Setting" tab
    Then Verify grid entry
      | Cluster Health Monitoring                                            |
      | LDAP Configuration                                                   |
      | Proxy & Environment Variables                                        |
      | SAML Configuration                                                   |
      | Logging Configuration                                                |
      | Application Configuration (theme, branding, notifications, and more) |
      | Account Configuration (timeouts and token refresh)                   |
    When Click Continue button on Options tab
    Then Verify "Run Import" tab is highlighted
    Then Verify Visible text
      | Text Type | Text to Search | Tag |
      | Page Text | Review Import  | h3  |
    Then Verify entity count
      | System View            |
      | Administrative Setting |
    When Click "Run Import" button
    Then Verify Visible text
      | Text Type | Text to Search | Tag |
      | Page Text | Running Import | h3  |
    Then Wait for Import to complete
      | Total Time | Polling Time |
      | 360      | 5            |
    When Click "Done" button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page header | Import Wizard  | h1  |
    Then Reload the webpage
    Then Verify Import grid record
      | File                  | Status          |
      | UI_Auto_Export_03.zip | Import Complete |

  Scenario: Verify if application configurations are imported successfully
    Given Verify execution of below scenarios is successful
      | Run Import Template for Application Configurations |
    When Navigate to page "/system/system-configuration/application-configuration"
    Then Verify Visible text
      | Text Type  | Text to Search                     | Tag |
      | Row Header | System & Cluster Health Monitoring | h4  |
    Then Verify "Enable Notification" checkbox is checked
    And Verify field "Email" value is "qa@fortinet.com"
    And Verify field "CPU Utilization (%)" value is "70"
    And Verify field "Disk Utilization (%)" value is "70"
    And Verify field "Swap Memory Utilization (%)" value is "70"
    And Verify field "Workflow Queue" value is "70"
    Then Verify "Soft Delete" checkbox is checked
    And Verify comment modification time is "15 Minutes"
    Then Verify audit log purging schedule keeps logs of "1" days
    Then Verify playbook recovery time is set to "15" seconds
    Then Verify report export timezone is set as "Asia/Kolkata"
    Then Verify "Select a theme" dropdown value is "Light"

  Scenario: Verify if Log Forwarding are imported successfully
    Given Verify execution of below scenarios is successful
      | Run Import Template for Application Configurations |
    When Navigate to page "/system/system-configuration/log-forwarding"
    Then Verify Visible text
      | Text Type | Text to Search        | Tag   |
      | Page Text | Enable Log Forwarding | label |
    Then Verify field "Configuration Name" value is "AutoSyslogServer"
    And Verify field "Server" value is "10.132.254.60"
    And Verify Protocol dropdown value is "UDP"
    And Verify field "Port" value is "514"
    And Verify Application Logs checkbox is checked

  Scenario: Verify if environment variables are imported successfully
    Given Verify execution of below scenarios is successful
      | Run Import Template for Application Configurations |
    When Navigate to page "/system/system-configuration/proxy-config"
    Then Verify Visible text
      | Text Type | Text to Search | Tag   |
      | Page Text | Proxy Settings | label |
    Then Verify proxy details are correctly populated

  Scenario: Verification if timeouts config are imported successfully
    Given Verify execution of below scenarios is successful
      | Run Import Template for Application Configurations |
    When Navigate to page "/security/authentication/account-config"
    Then Verify Visible text
      | Text Type | Text to Search         | Tag |
      | Page Text | Session & Idle Timeout | h4  |
    Then Verify "Idle Timeout" field value is "40"
    And Verify "Idle Timeout Grace Period" field value is "50"
    And Verify "Reauthenticate Dashboard User" field value is "25"
    And Verify "Reauthenticate Application User" field value is "25"

  Scenario: Verify if queue management settings was imported successfully
    Given Verify execution of below scenarios is successful
      | Run Import Template for Application Configurations |
    When Navigate to page "/assignment_automation/queues/"
    Then Verify Visible text
      | Text Type   | Text to Search           | Tag  |
      | Page Header | Queue & Shift Management | span |
    When Click queue settings button
    Then Verify Visible text
      | Text Type    | Text to Search            | Tag |
      | Popup Header | Queue Management Settings | h3  |
    When Click tab "Grid Display Settings"
    Then Severity is present under grid

  @Open_Bug #0841360
  Scenario:  Verify if branding was imported successfully
    Given Verify execution of below scenarios is successful
      | Run Import Template for Application Configurations |
    When Navigate to page "/system/system-configuration/branding"
    Then Verify Visible text
      | Text Type | Text to Search | Tag |
      | Page Text | Logo Settings  | h4  |
    Then Verify field "Company Name" value is "Auto_Fortinet"


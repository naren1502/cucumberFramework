@Regression
Feature: Connectors


  Scenario: Verify system connectors installed
    When Navigate to page "/content-hub/my-content/"
    Then Verify "Manage" tab is active
    Then Verify System Connector is Installed
      | Code Snippet        |
      | FortiSOAR ML Engine |
      | IMAP                |
      | Report Engine       |
      | SMTP                |
      | System Monitoring   |
      | Utilities           |
      | Phishing Classifier |


  Scenario: Install Data Ingestion Connector
    Given Navigate to page "/content-hub/all-content/"
    Then Verify "Discover" tab is active
    When Search by Connector Name
      | DataIngestionConnector | #Fortinet FortiAnalyzerVersion 3.1.0-7721
    Then Verify connector gets searched
      | DataIngestionConnector |
    When Click on Connector
      | DataIngestionConnector |
    Then Verify Connector detail is displayed
      | DataIngestionConnector |
    When Click on Install Button
    When Click "Confirm" button
    Then Verify installation in progress displayed

    Then Verify Connector is Active
    Then Verify Uninstall Button is displayed


  Scenario: Configure Data Ingestion Connector
    Given Verify execution of below scenarios is successful
      | Install Data Ingestion Connector |
    Given Verify Configurations Tab is displayed
    Then Verify Target Self is Selected
    Then Check Configuration status
      | NOT CONFIGURED |
    When Enter connector Configuration Name "Auto_Connector Config"
    When Select Configuration as a Default Configuration
    When Add Connector configuration details
      | Server_URL             | Username   | Password         | ADOM_Name |
      | https://10.132.253.22/ | automation | Cyber$p0nse@1234 | root      |
    When Clear the Port value
    When Deselected the Verify SSL checkbox
    Then Check Configuration status
      | IN PROGRESS |
    When Click Save Connector Config Button
    Then Verify Visible text
      | Text Type    | Text to Search        | Tag |
      | Popup header | Configuring Connector | h3  |
    Then Verify Status
    Then Verify HEALTH CHECK STATUS
    When Click "Close" button
    Then Verify Configurations Tab is displayed
    Then Verify Refresh button Visibility
    Then Verify Configuration Delete icon is enabled
    Then Verify Cancel button is enabled
    Then Verify Configure Data Ingestion button is enabled



  Scenario: Configure Data Ingestion
    Given Verify execution of below scenarios is successful
      | Configure Data Ingestion Connector |
    Given Verify Configurations Tab is displayed
    When Click on Configure Data Ingestion button
    Then Verify Data Ingestion wizard displayed
    Then Verify Start Step is highlighted on wizard

    When Click on Lets start by fetching some data button
    Then Verify user Navigates to Fetch Data step
    Then Verify Fetch Step is highlighted on wizard
    Then Verify Configurations Page is displayed
    Then Verify Fetch Data button is displayed
    Then Verify Back button is displayed
    When Add Configurations Details
      | Search Query      | Maximum Logs To Pull Per Event | Pull Sample Events in Past X Minutes |
      | severity='medium' | 5                              | 100000                               |
    When Click on Fetch Data button
    Then Verify User Navigates to Field Mapping step
    Then Verify Field Mapping Step is highlighted on wizard
    Then Verify Back button is displayed Field Mapping Step
    Then Verify Save Mapping & Continue button is displayed
    Then Verify Fetch additional sample data link is displayed
    Then Verify Alerts module is selected as Default module
    Then Verify Search field is present to search module field
    When Enter Alert module name field to search
    Then Verify Alert's field gets searched
    Then Verify Name field is mapped
    Then Verify Search field is present to search Sample Data
    When Enter sample data to search
      | alertid |
    When Click on Fetch additional sample data link
    Then Verify CONFIGURATIONS window displayed
    When Add Additional Configurations Details
      | Search Query      | Maximum Records to Fetch: | Pull Sample Events in Past X Minutes |
      | severity='medium' | 5                         | 150000                               |
    When Click on Fetch Data
    Then Verify User Navigates to Field Mapping step
    Then Verify Pagination gets added for Additional Data
    When Click on Save & Continue button
    Then Verify Scheduling Step is highlighted on wizard
    Then Verify user Navigates to Scheduling Data Ingestion
    When select Yes Do you want to schedule the ingestion
    When Enter schedule cron expression
    When Click on Limit execution to one active instance at a time
    When Click on Save Setting & Continue button
    Then Verify User Navigates to Summary step
    Then Verify Summary Step is highlighted on wizard
    Then Verify Quick Summary
      | Sample Data Fetched Successfully         |
      | Field Mappings Added                     |
      | Schedule Created                         |
      | Ingestion Playbooks Created Successfully |
    When Click on Done Button
    Then Verify Configurations Tab is displayed
    When Close Connector Configurations
    When Navigate to page "/modules/alerts"
    Then Verify User Navigated to Alerts
    Then Verify Alert got created
    Then Navigate to page "/schedules"
    Then Verify User Navigated to Schedules
    Then Search for Started Schedule "Ingestion_fortinet-fortianalyzer"
    When Click Stop Schedule Button
    Then Verify Stop schedule Toaster Message is displayed
    Then Verify Schedule Status set Inactive
    Then Verify Schedule Start button is displayed


  Scenario: Deactivate the connector
    Then Navigate to page "/content-hub/all-content/"
    Then Verify User Navigated to Content Hub Discover tab
    When Search content hub item "AWS Feed"

    Then Verify visibility of content hub item
      | connector | AWS Feed |
    When Click "connector" tile "AWS Feed"
    Then Verify "AWS Feed" configuration page opens
    When Click on Install Button
    When Click "Confirm" button
    Then Verify installation in progress displayed

    Then Verify Connector is Active
    Then Verify Uninstall Button is displayed
    Then Deactivate the connector

    Then Verify Visible text
      | Text Type             | Text to Search | Tag  |
      | Connector Action Name | Inactive       | span |


  Scenario: Verify a connector can have multiple configurations
    Given Verify execution of below scenarios is successful
      | Configure Data Ingestion Connector |
    Given Navigate to page "/content-hub/my-content/"
    Then Verify "Manage" tab is active
    When Search by Connector Name
      | DataIngestionConnector |
    Then Verify connector gets searched
      | DataIngestionConnector |
    When Click on Connector
      | DataIngestionConnector |
    Then Verify Connector detail is displayed
      | DataIngestionConnector |
    And Click "Add New Configuration" button
    When Enter connector Configuration Name "Auto_Connector Config 2"
    When Add Connector configuration details
      | Server_URL             | Username   | Password         | ADOM_Name |
      | https://10.132.253.22/ | automation | Cyber$p0nse@1234 | root      |
    When Clear the Port value
    When Deselected the Verify SSL checkbox
    When Click Save Connector Config Button
    Then Verify Visible text
      | Text Type    | Text to Search        | Tag |
      | Popup header | Configuring Connector | h3  |
    Then Verify Status
    Then Verify HEALTH CHECK STATUS
    When Click "Close" button
    Then Verify Health Check is available
    Then Verify multiple configurations are present in  Select Configuration dropdown
      | Auto_Connector Config   |
      | Auto_Connector Config 2 |
    When Select Configuration "Auto_Connector Config"
    Then Verify Health Check is available


  Scenario: Verify Ingestion connectors listed in Data Ingestion
    Given Verify execution of below scenarios is successful
    |Verify a connector can have multiple configurations|
    When Navigate to page "/data-ingestion"
    Then Verify Visible text
      | Text Type      | Text to Search         | Tag |
      | Connector Name | Fortinet FortiAnalyzer | div |
    Then Verify multiple configurations are present for the connector on the data ingestion page for connector "DataIngestionConnector"


  Scenario: Verify data ingestion with multiple configurations
    Given Verify execution of below scenarios is successful
    |Verify Ingestion connectors listed in Data Ingestion|
    When Click on settings button for configuration "Auto_Connector Config 2"
    Then Verify Data Ingestion wizard displayed
    Then Verify Start Step is highlighted on wizard

    When Click on Lets start by fetching some data button
    Then Verify user Navigates to Fetch Data step
    Then Verify Fetch Step is highlighted on wizard
    Then Verify Configurations Page is displayed
    Then Verify Fetch Data button is displayed
    Then Verify Back button is displayed
    When Add Configurations Details
      | Search Query      | Maximum Logs To Pull Per Event | Pull Sample Events in Past X Minutes |
      | severity='medium' | 5                              | 100000                               |
    When Click on Fetch Data button
    Then Verify User Navigates to Field Mapping step
    Then Verify Field Mapping Step is highlighted on wizard
    Then Verify Back button is displayed Field Mapping Step
    Then Verify Save Mapping & Continue button is displayed
    Then Verify Fetch additional sample data link is displayed
    Then Verify Alerts module is selected as Default module
    Then Verify Search field is present to search module field
    When Enter Alert module name field to search
    Then Verify Alert's field gets searched
    Then Verify Name field is mapped
    Then Verify Search field is present to search Sample Data
    When Enter sample data to search
      | alertid |
    When Click on Save & Continue button
    Then Verify Scheduling Step is highlighted on wizard
    Then Verify user Navigates to Scheduling Data Ingestion
    When select Yes Do you want to schedule the ingestion
    When Enter schedule cron expression
    When Click on Limit execution to one active instance at a time
    When Click on Save Setting & Continue button
    Then Verify User Navigates to Summary step
    Then Verify Summary Step is highlighted on wizard
    Then Verify Quick Summary
      | Sample Data Fetched Successfully         |
      | Field Mappings Added                     |
      | Schedule Created                         |
      | Ingestion Playbooks Created Successfully |
    When Click on Done Button
   # validate for multiple configuration separate playbook collection is created
    Then Verify different playbook collections are created for respective configuration
    Then Verify Stop Ingestion link is present for "Auto_Connector Config 2"
    Then Navigate to page "/schedules"
    Then Verify User Navigated to Schedules
 # schedule name is appended with playbook collection uuid so that will be validated here
    Then Search for started Schedule for configuration "Auto_Connector Config 2"
  #adding wait to avoid stale element error
    When Wait for specified time
      | 3 |
    Then Verify Schedule Status Set as Active
    Then Verify Schedule Stop button is Visible



  Scenario: Delete Ingestion configuration
    Given Verify execution of below scenarios is successful
    |Verify data ingestion with multiple configurations|
    Given Navigate to page "/content-hub/my-content/"
    Then Verify "Manage" tab is active
    When Search by Connector Name
      | DataIngestionConnector |
    Then Verify connector gets searched
      | DataIngestionConnector |
    When Click on Connector
      | DataIngestionConnector |
    Then Verify Connector detail is displayed
      | DataIngestionConnector |
    When Select Configuration "Auto_Connector Config 2"
    Then Verify Health Check is available
    When Click "Remove configuration" button
    When Click "Confirm" button
    Then Verify toaster message appears
      | "Fortinet FortiAnalyzer" connector updated successfully. |
    When Navigate to page "/data-ingestion"
    When Click connnector "DataIngestionConnector" on data ingestion page
    Then Verify configuration "Auto_Connector Config 2" is not present on ingestion page
    When Navigate to page "/schedules"
    Then Verify Schedule for configuration "Auto_Connector Config 2" is not present
    And  Verify schedule playbook is not present



  Scenario: Verify public visibility to connector configuration
    Given Verify execution of below scenarios is successful
      | Configure Data Ingestion Connector |
      | Run Import Template                |
  #log out before starting this test
    When Navigate to page "/logout"
    When Login to FortiSOAR
      | Username | Password     |
      | csadmin  | UserPassword |
    When Navigate to page "/content-hub/my-content/"
    Then Verify "Manage" tab is active
    When Search by Connector Name
      | DataIngestionConnector |
    Then Verify connector gets searched
      | DataIngestionConnector |
    When Click "Fortinet FortiAnalyzer" connector
    Then Verify "Fortinet FortiAnalyzer" connector configuration page opens
    Then Verify Connector is Active
    Then Verify default visibility is "Public"
    Then Verify "Private" visibility is disabled
    When Click Connector Cancel button
    Then Verify "Manage" tab is active
    When Navigate to page "/logout"
    Then Login to FortiSOAR
      | Username | Password  |
      | msd      | Demo@1234 |
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click Add record button
    And Add record details
      | Name                                           |
      | AlertCreatedForConnectorActionPublicVisibility |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForConnectorActionPublicVisibility |
    When Click Actions Button
    Then Verify Actions Window is opened
    When Search "Fortinet FortiAnalyzer" Connector in Action Window
    Then Verify "Fortinet FortiAnalyzer" Connector is Searched
    When Select "Fortinet FortiAnalyzer" Connector
    Then Verify "Fortinet FortiAnalyzer" Connector Actions are listed
      | Create Incident |
      | Get ADOMs       |
      | Update Incident |
      | Get Event       |
    When Click Action "Get ADOMs" for connector "Fortinet FortiAnalyzer"
    Then Verify Execute Action Window Opened
      | Fortinet FortiAnalyzer |
    When Click Execute Action
    Then Verify Output Tab is displayed
    Then Verify Input Tab is displayed
    Then Verify Key Value Section is displayed
    Then Verify Save Selected Output Keys Button is displayed
    When Select Output Key
    Then Save Selected Output Keys Button is enable
    When Click Save Selected Output Keys Button
    When Click Workspace Icon
    Then Verify Workspace is opened
    Then Verify Output Added section is present
    Then Verify Action "Get ADOMs" is present
    Then Verify ActionLog tag is added
    Then Verify View Details link is present
    When Click View Detail link
    Then Verify "Get ADOMs" Action Log window is opened
    Then Verify Output Tab is displayed
    Then Verify Input Tab is displayed



  Scenario: Verify Private visibility to connector configuration
    Given Verify execution of below scenarios is successful
      | Configure Data Ingestion Connector |
      | Run Import Template                |
    When Navigate to page "/logout"
    When Login to FortiSOAR
      | Username | Password     |
      | csadmin  | UserPassword |
    When Navigate to page "/content-hub/my-content/"
    Then Verify "Manage" tab is active
    When Search by Connector Name
      | DataIngestionConnector |
    Then Verify connector gets searched
      | DataIngestionConnector |
    When Click "Fortinet FortiAnalyzer" connector
    Then Verify "Fortinet FortiAnalyzer" connector configuration page opens
    Then Verify Connector is Active
    When Click "Private" button
    Then Verify Assigned Teams icon gets enabled
    Then Check Configuration status
      | IN PROGRESS |
    When Click ASSIGN OWNERS icon
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page header | ASSIGN OWNERS  | h3  |
    When Select Team "Sibling Team"
    When Click to Assign Team
    Then Verify "Sibling Team" Team's tag added
    When Click "Submit" button
    When Click Save Connector Config Button
    Then Verify Visible text
      | Text Type    | Text to Search        | Tag |
      | Popup header | Configuring Connector | h3  |
    Then Verify HEALTH CHECK STATUS
    And Click button "Close"
    When Navigate to page "/logout"
    Then Login to FortiSOAR
      | Username | Password  |
      | msd      | Demo@1234 |
    When Navigate to page "/connectors"
# Check for Assigned team the configurations should  be visible
    Then Verify "Manage" tab is active
    When Search by Connector Name
      | DataIngestionConnector |
    Then Verify connector gets searched
      | DataIngestionConnector |
    When Click "Fortinet FortiAnalyzer" connector

    Then verify "Auto_Connector Config" connector configuration is visible
    When Navigate to page "/modules/alerts"
    Then Verify User Navigated to Alerts
    Then Alert Grid is displayed
    When Click Add record button
    And Add record details
      | Name                                            |
      | AlertCreatedForConnectorActionPrivateVisibility |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForConnectorActionPrivateVisibility |
    When Click Actions Button
    Then Verify Actions Window is opened
    When Search "Fortinet FortiAnalyzer" Connector in Action Window
    Then Verify "Fortinet FortiAnalyzer" Connector is Searched
    When Select "Fortinet FortiAnalyzer" Connector
    When Click Action "Get ADOMs"
    Then verify "Auto_Connector Config" connector configurations is visible in Direct Connector Action
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
    And Update role assignment for user "Virat Kohli" with below detail
      | Full App Permissions  | Yes |
    When Navigate to page "/logout"
# Check for unassigned team the connector configurations should not be visible
    Then Login to FortiSOAR
      | Username | Password  |
      | virat    | Demo@1234 |
    When Navigate to page "/content-hub/my-content/"
    Then Verify "Manage" tab is active
    When Search by Connector Name
      | DataIngestionConnector |
    Then Verify connector gets searched
      | DataIngestionConnector |
    When Click "Fortinet FortiAnalyzer" connector
    Then verify "Auto_Connector Config" connector configurations is not visible


  Scenario: Verify RBAC on Connector Action
    Given Verify execution of below scenarios is successful
      | Configure Data Ingestion Connector |
      | Run Import Template                |
    When Navigate to page "/logout"
    When Login to FortiSOAR
      | Username | Password     |
      | csadmin  | UserPassword |
    When Navigate to page "/connectors"
    Then Verify "Manage" tab is active
    When Search by Connector Name
      | DataIngestionConnector |
    Then Verify connector gets searched
      | DataIngestionConnector |
    When Click "Fortinet FortiAnalyzer" connector
    Then Verify "Fortinet FortiAnalyzer" connector configuration page opens
    When Click "Actions & Playbooks" link
    Then Verify "Fortinet FortiAnalyzer" Connector Actions are listed
      | CREATE INCIDENT |
      | GET ADOMS       |
    Then Verify Assign Roles to Action icon visible
  # Action "Get Adoms" row's icon is clicked
    When click "GET ADOMS" Actions Assign Role to Action Link
    Then Verify Assign Role(s) to Action Window is opened
    Then Verify connector name "Fortinet FortiAnalyzer" is displayed
    Then Verify search TextField is displayed
    Then Verify Roles are listed
      | SOC Manager               |
      | Security Administrator    |
      | Full App Permissions      |
      | FortiSOAR Agent           |
      | SOC Analyst               |
      | Playbook Administrator    |
      | Application Administrator |
    When Select "Full App Permissions" Role checkbox
    When Click OK button to Select Role
    Then Verify Visible text
      | Text Type  | Text to Search      | Tag |
      | Tab Header | Actions & Playbooks | a   |
    Then Verify Assigned Role "Full App Permissions" displayed at "GET ADOMS" action row
    When Close Connector Configurations
    When Navigate to page "/logout"
# Verifying "Get Adoms" action execution is enabled for Full App Permission Role user i.e for msd user
    Then Login to FortiSOAR
      | Username | Password  |
      | msd      | Demo@1234 |
    When Navigate to page "/modules/alerts"
    Then Verify User Navigated to Alerts
    When Click Add record button
    And Add record details
      | Name                                           |
      | Alert_Created_For_ConnectorRBAC_Action_Enabled |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "Alert_Created_For_ConnectorRBAC_Action_Enabled |
    When Click Actions Button
    Then Verify Actions Window is opened
    When Search "Fortinet FortiAnalyzer" Connector in Action Window
    Then Verify "Fortinet FortiAnalyzer" Connector is Searched
    When Select "Fortinet FortiAnalyzer" Connector

    When Click Action "Get ADOMs"
    Then verify "Auto_Connector Config" connector configurations is visible in Direct Connector Action
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
# Verifying "Get Adoms" action execution is disabled for SOC Analyst user i.e for virat user
    And Update role assignment for user "Virat Kohli" with below detail
      | Full App Permissions  | No |
    When Navigate to page "/logout"
    Then Login to FortiSOAR
      | Username | Password  |
      | virat    | Demo@1234 |
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click Add record button
    And Add record details
      | Name                                            |
      | Alert_Created_For_ConnectorRBAC_Action_Disabled |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "Alert_Created_For_ConnectorRBAC_Action_Disabled |
    When Click Actions Button
    Then Verify Actions Window is opened
    When Search "Fortinet FortiAnalyzer" Connector in Action Window
    Then Verify "Fortinet FortiAnalyzer" Connector is Searched
    When Select "Fortinet FortiAnalyzer" Connector

    Then Verify "Get ADOMs" action is disabled



 

@Regression
Feature: Data Archival

  Scenario: Verify default database settings for Data Archival
    And Navigate to page "/system/archival/settings"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page header | Data Archival  | div |
    And Verify "Database" configurations for data archival
      | Host:localhost         |
      | Database:data_archival |
      | Port:5432              |
      | Username:cyberpgsql    |
    And "Database enable toggle" "DatabaseForArchival_Enabled" is visible on "Data Archival Page"
    And Verify Database enable toggle settings can not be disabled

  Scenario: Setup Syslog server for log archival
    Given Verify execution of below scenarios is successful
      | Verify default database settings for Data Archival |
    When Click "Link" "Link_SetupSyslog" on "Data Archival Page" using locator type "id"
    Then Verify Visible text
      | Text Type    | Text to Search           |
      | Popup header | Archival Syslog Settings |
    When Enter "10.132.254.149" in field "Server"
    And Set select type dropdown field "Protocol" to "UDP"
    And Enter "514" in field "Port"
    And Click button "Save"
    Then Verify toaster message appears
      | Log forwarding configuration updated successfully. |
    When "Enable" syslog configuration for data archival
    Then Verify toaster message appears
      | Archival setting saved successfully |

  Scenario: Set Alert module for data archival
    Given Verify execution of below scenarios is successful
      | Setup Syslog server for log archival |
    And Scroll to text "Archival Rules"
    When Select option "Alerts" in the dropdown "DataArchival_Module" on "Data Archival Page"
    And Click button "Add Module"
    Then Text "Alerts" is present in "DataArchival_Module_Header" on "Data Archival Page"
    And Text "Draft" is present in "DataArchival_AlertsModule_Status" on "Data Archival Page"
    And Text "24" is present in textbox "DataArchival_Textbox_DataArcchiveTimePeriod" on "Module setup form for data archival"
    When Enter text "3" in "DataArchival_Textbox_DataArcchiveTimePeriod" on "Module setup form for data archival"
    When Scroll to text "Save and Start Archival"
    And Click "Save and Start Archival" label
    Then Verify Visible text
      | Text Type  | Text to Search                        |
      | Popup text | Save changes to the archival settings |
    When Click button "Confirm"
    Then Verify for "Alerts" module the archival status is "Active"

  Scenario: Trigger Data Archival schedule
    Given Verify execution of below scenarios is successful
      | Set Alert module for data archival |
    Given Import the configuration file "Alert_Records_For_Data_Archival_01.zip"
    And Navigate to page "/system/archival/settings"
    Then Verify archival schedule status is "Inactive"
    When Click button "View"
    Then Verify Visible text
      | Text Type            | Text to Search   |
      | Schedule form header | Schedule Details |
    When Click "Start Schedule" label
    And Click button "Save"
    Then Verify toaster message appears
      | Archive Data has been updated successfully! |
    When Click button "Run Schedule Now"
    Then Verify toaster message appears
      | Schedule triggered successfully |
    And Click button "Close"
    Then Verify archival schedule status is "Active"
    # Wait for archival PB to complete execution
    When Wait for specified time
      | 5 |
    And Navigate to page "/system/archival/search"
    Then Verify grid record count is "10"

  Scenario: Pause Data Archival rule
    Given Verify execution of below scenarios is successful
      | Trigger Data Archival schedule |
    And Navigate to page "/system/archival/settings"
    And Scroll to text "Archived Modules"
    When Click "link" "DataArchival_Link_PauseArchival" on "Archived modules section"
    Then Verify Visible text
      | Text Type  | Text to Search                               |
      | Popup text | Are you sure that you want to pause archival |
    When Click button "Confirm"
    Then Verify toaster message appears
      | Archival paused for Alerts module |
    And Verify for "Alerts" module the archival status is "Archival Paused"

  Scenario: Trigger archival and verify paused module doesn't get archived
    Given Verify execution of below scenarios is successful
      | Pause Data Archival rule |
    And Import the configuration file "Alert_Records_For_Data_Archival_02.zip"
    And Navigate to page "/system/archival/settings"
    Then Verify archival schedule status is "Active"
    When Click button "View"
    Then Verify Visible text
      | Text Type            | Text to Search   |
      | Schedule form header | Schedule Details |
    When Click button "Run Schedule Now"
    Then Verify toaster message appears
      | Schedule triggered successfully |
    And Click button "Close"
    # Wait for archival PB to complete execution
    When Wait for specified time
      | 5 |
    And Navigate to page "/system/archival/search"
    Then Verify grid record count is "10"

  @Open_Bug #0927318
  Scenario: Resume the archival rule
    Given Verify execution of below scenarios is successful
      | Trigger archival and verify paused module doesn't get archived |
    And Navigate to page "/system/archival/settings"
    And Scroll to text "Archived Modules"
    When Click "link" "DataArchival_Link_ResumeArchival" on "Archived modules section"
    Then Verify Visible text
      | Text Type  | Text to Search                                |
      | Popup text | Are you sure that you want to resume archival |
    When Click button "Confirm"
    Then Verify toaster message appears
      | Archival paused for Alerts module |
    And Verify for "Alerts" module the archival status is "Active"

  Scenario: Trigger archival and verify resumed module gets archived
    Given Verify execution of below scenarios is successful
      | Resume the archival rule |
    And Navigate to page "/system/archival/settings"
    Then Verify archival schedule status is "Active"
    When Click button "View"
    Then Verify Visible text
      | Text Type            | Text to Search   |
      | Schedule form header | Schedule Details |
    When Click button "Run Schedule Now"
    Then Verify toaster message appears
      | Schedule triggered successfully |
    And Click button "Close"
    # Wait for archival PB to complete execution
    When Wait for specified time
      | 5 |
    And Navigate to page "/system/archival/search"
    Then Verify grid record count is "20"

  @Open_Bug #0927342
  Scenario: Pause all Data Archival rules
    Given Verify execution of below scenarios is successful
      | Resume the archival rule |
    And Navigate to page "/system/archival/settings"
    And Scroll to text "Archived Modules"
    When Click "Pause All" label
    Then Verify Visible text
      | Text Type  | Text to Search                                                      |
      | Popup text | Are you sure that you want to pause archival for all of the modules |
    When Click button "Confirm"
    And Wait for specified time
      | 3 |
    Then Verify for "Alerts" module the archival status is "Archival Paused"

  Scenario: Trigger archival and verify paused modules don't get archived
    Given Verify execution of below scenarios is successful
      | Pause all Data Archival rules |
    And Import the configuration file "Alert_Records_For_Data_Archival_03.zip"
    And Navigate to page "/system/archival/settings"
    Then Verify archival schedule status is "Active"
    When Click button "View"
    Then Verify Visible text
      | Text Type            | Text to Search   |
      | Schedule form header | Schedule Details |
    When Click button "Run Schedule Now"
    Then Verify toaster message appears
      | Schedule triggered successfully |
    And Click button "Close"
    # Wait for archival PB to complete execution
    When Wait for specified time
      | 5 |
    And Navigate to page "/system/archival/search"
    Then Verify grid record count is "20"

  Scenario: Resume all Data Archival rules
    Given Verify execution of below scenarios is successful
      | Pause all Data Archival rules |
    And Navigate to page "/system/archival/settings"
    And Scroll to text "Archived Modules"
    When Click "Resume All" label
    Then Verify Visible text
      | Text Type  | Text to Search                                                       |
      | Popup text | Are you sure that you want to resume archival for all of the modules |
    When Click button "Confirm"
    And Wait for specified time
      | 3 |
    Then Verify for "Alerts" module the archival status is "Active"

  Scenario: Trigger archival and verify resumed modules get archived
    Given Verify execution of below scenarios is successful
      | Resume all Data Archival rules |
    And Navigate to page "/system/archival/settings"
    Then Verify archival schedule status is "Active"
    When Click button "View"
    Then Verify Visible text
      | Text Type            | Text to Search   |
      | Schedule form header | Schedule Details |
    When Click button "Run Schedule Now"
    Then Verify toaster message appears
      | Schedule triggered successfully |
    And Click button "Close"
    # Wait for archival PB to complete execution
    When Wait for specified time
      | 5 |
    And Navigate to page "/system/archival/search"
    Then Verify grid record count is "30"

  Scenario: Disable Syslog server for log archival
    Given Verify execution of below scenarios is successful
      | Setup Syslog server for log archival |
    And Navigate to page "/system/archival/settings"
    And Scroll to text "Archival Destination"
    When "Disable" syslog configuration for data archival
    Then Verify toaster message appears
      | Archival setting saved successfully |

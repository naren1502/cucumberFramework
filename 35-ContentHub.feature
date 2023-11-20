@Regression
Feature: Content Hub


  Scenario: Verify filters on content hub
    When Navigate to page "/content-hub/all-content/"
    Then Verify User Navigated to Content Hub Discover tab
    When Select "Connectors" checkbox
    Then Verify filter tag "Connectors" is visible
    When Search content hub item "VirusTotal"
    Then Verify visibility of content hub item
      | connector | VirusTotal |
    When Search content hub item "ChatOps"
    Then Verify invisibility of content hub item
      | Solution Pack | ChatOps |
    Then Verify "Content Type" clear filter button is enabled
    When Click "Content Type" clear filter button
    Then Verify visibility of content hub item
      | Solution Pack | ChatOps |
    When Clear content hub searchbox
    When Select "Authentication" checkbox
    Then Verify filter tag "Authentication" is visible
    When Search content hub item "Fortinet FortiAuthenticator"
    Then Verify visibility of content hub item
      | connector | Fortinet FortiAuthenticator |
    When Search content hub item "ChatOps"
    Then Verify invisibility of content hub item
      | Solution Pack | ChatOps |
    Then Verify "Category" clear filter button is enabled
    When Click "Category" clear filter button
    Then Verify visibility of content hub item
      | Solution Pack | ChatOps |
    When Clear content hub searchbox
    When Select "Community" checkbox
    Then Verify filter tag "Community" is visible
    When Search content hub item "Amazon Alexa"
    Then Verify visibility of content hub item
      | connector | Amazon Alexa |
    When Search content hub item "ChatOps"
    Then Verify invisibility of content hub item
      | Solution Pack | ChatOps |
    Then Verify "Publisher" clear filter button is enabled
    When Click "Publisher" clear filter button
    Then Verify visibility of content hub item
      | Solution Pack | ChatOps |
    When Clear content hub searchbox
    When Select "Connectors" checkbox
    When Select "Analytics and SIEM" checkbox
    When Select "Fortinet" checkbox
    Then Verify filter tag "Connectors" is visible
    Then Verify filter tag "Analytics and SIEM" is visible
    Then Verify filter tag "Fortinet" is visible
    When Search content hub item "Devo"
    Then Verify visibility of content hub item
      | connector | Devo |
    When Search content hub item "ChatOps"
    Then Verify invisibility of content hub item
      | Solution Pack | ChatOps |
    Then Verify clear all filter button is enabled
    When Click clear all filter button
    Then Verify visibility of content hub item
      | Solution Pack | ChatOps |
    When Clear content hub searchbox


  Scenario: Verify SOAR Framework solution pack is installed
    Given Navigate to page "/content-hub/my-content/"
    Then Verify User Navigated to Content Hub Manage tab
    When Search content hub item "SOAR Framework"
    Then Verify visibility of content hub item
      | Solution Pack | SOAR Framework |
    When Click "Solution Pack" tile "SOAR Framework"
    Then Verify "SOAR Framework" configuration page opens
    Then Verify Delete Template button is visible
    And Verify Solution Pack details
      | Certified | Publisher |
      | Yes       | Fortinet  |
    And Close Connector Configurations


  Scenario: Verify solution pack tile details
    Given Navigate to page "/content-hub/my-content/?contentType=solutionpack"
    Given Search content hub item "SOAR Framework"
    And Verify visibility of content hub item
      | Solution Pack | SOAR Framework |
    And Wait for specified time
      | 1 |
    Then Verify "SOAR Framework" solution pack tile has below details
      | Solution Pack Icon  |
      | Tile Header         |
      | Installation Icon   |
      | Solution Pack Title |
      | Version Details     |
      | Image               |
      | Description         |


  Scenario: Install repo solution pack - BFA
    Given Navigate to page "/content-hub/all-content/"
    Then Verify User Navigated to Content Hub Discover tab
    When Search content hub item "Brute Force Attack Response"
    Then Verify visibility of content hub item
      | Solution Pack | Brute Force Attack Response |
    When Click "Solution Pack" tile "Brute Force Attack Response"
    Then Verify "Brute Force Attack Response" configuration page opens
    And Verify Visible text
      | Text Type | Text to Search | Tag    |
      | Button    | Install        | button |
    When Click "Install" button
    Then Verify Visible text
      | Text Type    | Text to Search                     | Tag  |
      | Popup header | Confirm Solution Pack Installation | span |
    When Click "Confirm" button
    Then Verify Visible text
      | Text Type    | Text to Search                                      | Tag |
      | Popup header | Install Solution Pack - Brute Force Attack Response | h3  |
    Then Wait for solution pack installation to complete
      | Polling Timeout (In Seconds) |
      | 180                          |
    Then Verify Delete Template button is visible
    And Verify solution pack dependencies are installed
      | SOAR Framework |
      | SOC Simulator  |


    #todo - add validation for succesfull BFA Invetigation playbook execution
  Scenario: Execute BFA usecase
    Given Verify execution of below scenarios is successful
      | Install repo solution pack - BFA |
    Given Configure connector
      | ConnectorName | Version | ConfigName  | Key01  |
      | virustotal    | 3.0.2   | auto_config | APIKey |
    Given Navigate to page "/modules/alerts"
    And Wait for specified time
      | 2 |
    Then Alert Grid is displayed
    Then Verify Visible text
      | Text Type | Text to Search    | Tag    |
      | Button    | Simulate Scenario | button |
    When Click "Simulate Scenario" button
    Then Verify Visible text
      | Text Type    | Text to Search    | Tag |
      | Popup header | Simulate Scenario | h3  |
    When Click scenario dropdown
    Then Select scenario "Brute Force Attempt"
    And Wait for specified time
      | 1 |
    And Click "Start Scenario" button
    Then Verify toaster message appears
      | Triggered action "Run Selected Scenario". |
    Then Verify grid row "Repeated Login Failures on 192.168.60.172" is present
    When Click grid cell with text "Repeated Login Failures on 192.168.60.172"
    Then Verify Visible text
      | Text Type    | Text to Search                            | Tag |
      | Record Title | Repeated Login Failures on 192.168.60.172 | p   |
    When Click Execute Button
    Then Verify Search Playbook field displayed
    Then Verify Playbook is available for execution
      | Investigate Brute Force |
    When Select Playbook from execution window
      | Investigate Brute Force |
    Then Verify toaster message appears
      | Triggered action |
    #Wait for PB execution to be complete
    When Wait for specified time
      | 5 |


  Scenario: Verify Solution Pack details page
    Given Verify execution of below scenarios is successful
      | Install repo solution pack - BFA |
    Given Navigate to page "/content-hub/my-content/"
    Then Verify User Navigated to Content Hub Manage tab
    When Search content hub item "Brute Force Attack Response"
    Then Verify visibility of content hub item
      | Solution Pack | Brute Force Attack Response |
    When Click "Solution Pack" tile "Brute Force Attack Response"
    Then Verify "Brute Force Attack Response" configuration page opens
    And Verify Solution Pack details
      | Certified | Publisher |
      | Yes       | Fortinet  |
    Then Verify "Summary" tab is highlighted
    And Verify solution pack dependencies are installed
      | SOAR Framework |
      | SOC Simulator  |
    And Verify solution pack annotations
      | Category       | Tags               |
      | Authentication | Brute Force Attack |
    When Click Contents tab
    Then Verify "Contents" tab is highlighted
    Then Verify solution pack contents
      | Playbook Collection(s)             | Connector(s)     | Record Set(s) |
      | 02 - Use Case - Brute Force Attack | Active Directory | Scenario (2)  |
      |                                    | Splunk           |               |
      |                                    | VirusTotal       |               |


  Scenario: Export installed solution pack
    Given Verify execution of below scenarios is successful
      | Install repo solution pack - BFA |
    Given Navigate to page "/content-hub/my-content/"
    Then Verify User Navigated to Content Hub Manage tab
    When Search content hub item "Brute Force Attack Response"
    Then Verify visibility of content hub item
      | Solution Pack | Brute Force Attack Response |
    When Click "Solution Pack" tile "Brute Force Attack Response"
    Then Verify "Brute Force Attack Response" configuration page opens
    And Wait for specified time
      | 2 |
    Given Export button is visible
    When Click Export button
    Then Verify Visible text
      | Text Type   | Text to Search       | Tag |
      | Popup Title | Export Solution Pack | h3  |
    Then Wait for solution pack export to complete
      | Polling Timeout (In Seconds) |
      | 60                           |
    When Click Download File button
    When Wait for specified time
      | 5 |
    And Set filename parameter values
    Then Verify configuration file is downloaded succesfully
    Then Verify the contents in downloaded configuration file
      | Internal Folders |
      | connectors       |
      | playbooks        |
      | records          |


  Scenario: Edit repo solution pack - BFA and save it in workspace
    Given Verify execution of below scenarios is successful
      | Install repo solution pack - BFA |
    Given Navigate to page "/content-hub/all-content/"
    When Search content hub item "Brute Force Attack Response"
    Then Verify visibility of content hub item
      | Solution Pack | Brute Force Attack Response |
    When Click "Solution Pack" tile "Brute Force Attack Response"
    Then Verify "Brute Force Attack Response" configuration page opens
    And Verify Visible text
      | Text Type | Text to Search | Tag    |
      | Button    | Edit           | button |
    When Click "Edit" button
    Then Verify visible text
      | Text Type    | Text to Search                                                        | Tag  |
      | Popup header | To edit this Solution Pack you need to make a local copy of the pack. | span |
    When Click "Add Version" button
    Then Verify visible text
      | Text Type            | Text to Search      | Tag |
      | Configuration header | Clone Solution Pack | h3  |
    Then Verify "About Solution Pack" tab is highlighted
    Then Verify "Prerequisites" tab is not highlighted
    Then Verify visible text
      | Text Type           | Text to Search     | Tag   |
      | Configuration label | Solution Pack Name | label |
    Then Verify field "Solution Pack Name" value is "Brute Force Attack Response Dev"
    And Enter "Brute Force Attack Response Dev UI Automation" in field "Solution Pack Name"
    Then Enter "9.9.9" in field "Version"
    Then Verify visible text
      | Text Type           | Text to Search | Tag   |
      | Configuration label | Publisher      | label |
    And Enter "UI Auto" in field "Publisher"
    Then Verify visible text
      | Text Type           | Text to Search | Tag   |
      | Configuration label | Compatibility  | label |
    Then Verify field "Compatibility" value is "7.2.0"
    And Enter "7.2.1" in field "Compatibility"
    Then Verify visible text
      | Text Type           | Text to Search | Tag   |
      | Configuration label | Description    | label |
    And Enter "Updated by UI Automation script" in TextArea "Description"
    Then Verify visible text
      | Text Type           | Text to Search | Tag   |
      | Configuration label | Support Info   | label |
    And Enter "FortiSOAR QA Team" in TextField Support Info
    Then Verify visible text
      | Text Type           | Text to Search | Tag   |
      | Configuration label | Category       | label |
    Then Verify the Category value on solution pack wizard
    And Add "Asset Management" value in dropdown Category on solution pack wizard
    When Click "Category" label
    ## reusing step for tag verification  ..see global search feature
    Then Search Term "Brute Force Attack" is present
    ##And Add custom tag with value "bfa_auto"
    When Add record details
      | Tags       |
      | BFA_UiAuto |
    When Click "Tags" label
    When Click Continue button on About Solution Pack tab
    Then Verify "Prerequisites" tab is highlighted
    Then Verify "Choose Entities" tab is not highlighted
    Then Verify visible text
      | Text Type            | Text to Search                 | Tag |
      | Configuration header | Add Solution Pack Dependencies | div |
    Then Verify solution pack dependencies are installed
      | SOAR Framework |
      | SOC Simulator  |
    Then Verify visible text
      | Text Type       | Text to Search | Tag   |
      | Parameter label | Prerequisities | label |
    #When Click "Continue" button
    When Click Continue button on Prerequisites tab
    Then Verify "Choose Entities" tab is highlighted
    Then Verify "Filter Data" tab is not highlighted
    Then Verify visible text
      | Text Type            | Text to Search        | Tag |
      | Configuration header | Select Configurations | p   |
    Then Verify select all checkbox is not selected
    Then Click "Dashboards" label
    #When Click "Continue" button
    When Click continue button on Choose Entities tab of solution pack edit wizard
    Then Verify "Filter Data" tab is highlighted
    Then Verify "Create Solution Pack" tab is not highlighted
    Then Verify Include Everything checkbox is not selected
    Then Click "Dashboards" tab
    Then Verify visible text
      | Text Type   | Text to Search              | Tag |
      | Page header | Choose Dashboards to Export | h4  |
    Then Click "System Health Status" label
    When Verify entity count is correct on solution pack wizard
      | Entity              | Count |
      | Module              | 1     |
      | Picklist            | 0     |
      | Dashboard           | 1     |
      | Playbook Collection | 1     |
      | Global Variable     | 0     |
      | Connector           | 3     |
    #When Click "Continue" button
    When Click "Button" "Button_Continue_Filter_Data_EditSolutionPack" on "Filter Data tab" using locator type "id"
    Then Verify "Create Solution Pack" tab is highlighted
    Then Verify visible text
      | Text Type   | Text to Search       | Tag |
      | Page header | Review Solution pack | h3  |
    Then Verify visible text
      | Text Type | Text to Search                                     | Tag |
      | Text      | Dependency(s)                                      | div |
      | Text      | SOAR Framework                                     | li  |
      | Text      | SOC Simulator                                      | li  |
      | Text      | Prerequisite(s)                                    | div |
      | Text      | Configure the VirusTotal Connector                 | li  |
      | Text      | Configure the Splunk Connector                     | li  |
      | Text      | Configure the Microsoft Active Directory Connector | li  |
      | Text      | 1 Module Schema(s)                                 | div |
      | Text      | 1 Dashboard(s)                                     | div |
      | Text      | 1 Playbook Collection(s)                           | div |
      | Text      | 3 Connector(s)                                     | div |
      | Text      | Brute Force Attack Response Dev UI Automation      | div |
      | Text      | Version: 9.9.9                                     | div |
    When Click "Save As Draft To Workspace" button
    Then Verify toaster message appears
      | Solution Pack created successfully. |
    Then Verify visible text
      | Text Type   | Text to Search                                      | Tag |
      | Page header | Solution Pack Successfully Saved To Your Workspace! | div |
    Then Verify "Download Solution Pack File" button is visible
    When Click "Download Solution Pack File" button
    ##can't find downloaded file path on mac--->>Then Verify file "FortiSOAR-Brute Force Attack Response UI Automation-9.9.9" is downloaded
    And Navigate to page "/content-hub/all-content/?searchText=Brute%20Force%20Attack%20Response"
    ##The edited sp tile must be present Under Discover tab
    Then Verify visibility of content hub item
      | Solution Pack | Brute Force Attack Response Dev UI Automation |


  Scenario: Verify edited repo sp is present in workspace
    Given Verify execution of below scenarios is successful
      | Edit repo solution pack - BFA and save it in workspace |
    Given Navigate to page "/content-hub/workspace/"
     ####The edited sp tile must be present Under Create tab
    Then Verify "Create" tab is active
    Then Search content hub item "Brute Force Attack Response Dev UI Automation"
    Then Verify visibility of content hub item
      | Solution Pack | Brute Force Attack Response Dev UI Automation |


  Scenario: Edit repo solution pack - BFA  , save it and publish
    Given Verify execution of below scenarios is successful
      | Edit repo solution pack - BFA and save it in workspace |
    Given Navigate to page "/content-hub/workspace/"
    When Search content hub item "Brute Force Attack Response Dev UI Automation"

    When Click "Solution Pack" tile "Brute Force Attack Response Dev UI Automation"
    Then Verify visibility of content hub item
      | Solution Pack | Brute Force Attack Response Dev UI Automation |
    Then Verify visible text
      | Text Type    | Text to Search        | Tag |
      | Popup header | Version: 9.9.9        | p   |
      | Popup header | Published By: UI Auto | p   |
      | Popup header | Status: Not Installed | p   |
    When Click button "Edit"
    Then Verify visible text
      | Text Type            | Text to Search                          | Tag  |
      | Confirm Popup header | Do you want to edit this Solution Pack? | span |
    Then Verify visible text
      | Text Type            | Text to Search                                                                                         | Tag  |
      | Confirm Popup header | Note that, only the contents in the solution pack for which you have access will be available to edit. | span |
    When Click "Edit" button
    Then Verify visible text
      | Text Type            | Text to Search     | Tag |
      | Configuration header | Edit Solution Pack | h3  |
    Then Verify "About Solution Pack" tab is highlighted
    Then Verify "Prerequisites" tab is not highlighted
    Then Verify field "Solution Pack Name" value is "Brute Force Attack Response Dev UI Automation"
    #If user wants to update the existing field value for final publish
    And Enter "Brute Force Attack Response Dev UI Automation Final" in field "Solution Pack Name"
    Then Verify field "Version" value is "9.9.9"
    Then Verify field "Publisher" value is "UI Auto"
    Then Verify field "Compatibility" value is "7.2.1"
    Then Verify textarea field "Description" value is "Updated by UI Automation script"
    Then Verify field "Support Info" value is "FortiSOAR QA Team"
    Then Verify the Category value on solution pack wizard
    And Add "Analytics and SIEM" value in dropdown Category on solution pack wizard
    When Click "Category" label
    ## reusing step for tag verification  ..see global search feature
    Then Search Term "Brute Force Attack" is present
    Then Search Term "BFA_UiAuto" is present
    When Click "Tags" label
    When Click "Continue" button
    Then Verify "Prerequisites" tab is highlighted
    Then Verify "Choose Entities" tab is not highlighted
    Then Verify visible text
      | Text Type            | Text to Search                 | Tag |
      | Configuration header | Add Solution Pack Dependencies | div |
    #When Click "Continue" button
    When Click Continue button on Prerequisites tab
    Then Verify "Choose Entities" tab is highlighted
    Then Verify "Filter Data" tab is not highlighted
    Then Verify visible text
      | Text Type            | Text to Search        | Tag |
      | Configuration header | Select Configurations | p   |
    Then Verify select all checkbox is not selected
    #When Click "Continue" button
    When Click continue button on Choose Entities tab of solution pack edit wizard
    Then Verify "Filter Data" tab is highlighted
    Then Verify "Update Solution Pack" tab is not highlighted
    Then Verify Include Everything checkbox is not selected
    #When Click "Continue" button
    When Click "Button" "Button_Continue_Filter_Data_EditSolutionPack" on "Filter Data tab" using locator type "id"
    Then Verify "Update Solution Pack" tab is highlighted
    Then Verify visible text
      | Text Type   | Text to Search       | Tag |
      | Page header | Review Solution pack | h3  |
    Then Verify visible text
      | Text Type | Text to Search                                     | Tag |
      | Text      | Dependency(s)                                      | div |
      | Text      | SOAR Framework                                     | li  |
      | Text      | SOC Simulator                                      | li  |
      | Text      | Prerequisite(s)                                    | div |
      | Text      | Configure the VirusTotal Connector                 | li  |
      | Text      | Configure the Splunk Connector                     | li  |
      | Text      | Configure the Microsoft Active Directory Connector | li  |
      | Text      | 1 Module Schema(s)                                 | div |
      | Text      | 1 Dashboard(s)                                     | div |
      | Text      | 1 Playbook Collection(s)                           | div |
      | Text      | 3 Connector(s)                                     | div |
      | Text      | Brute Force Attack Response Dev UI Automation      | div |
      | Text      | Version: 9.9.9                                     | div |
    When Click "Save and Publish" button
    Then Verify toaster message appears
      | Solution Pack updated and published successfully. |
    Then Verify visible text
      | Text Type   | Text to Search                                | Tag |
      | Page header | Solution Pack Successfully Published Locally! | div |
    Then Verify "Download Solution Pack File" button is visible
    When Click "Download Solution Pack File" button
    ##The below step not included because it can't find downloaded file path on mac,validation need's to be corrected.
    ##Then Verify file "FortiSOAR-Brute Force Attack Response UI Automation-9.9.9" is downloaded
    ##To close the Edit Solution Pack Wizard after publishing it successfully.
    Then Close Record Detail View
    ##The published solution pack must be present Under Manage tab
    When Navigate to page "/content-hub/my-content/"
    Then Verify User Navigated to Content Hub Manage tab
    When Search content hub item "Brute Force Attack Response Dev UI Automation Final"
    Then Verify visibility of content hub item
      | Solution Pack | Brute Force Attack Response Dev UI Automation Final |
    Then Verify visible text
      | Text Type | Text to Search                  | Tag |
      | Label     | Version: 9.9.9                  | p   |
      | Label     | Published By: UI Auto           | p   |
      | Label     | Certified: No                   | p   |
      | Label     | Updated by UI Automation script | p   |


  Scenario: Delete Template of repo solution pack - BFA
    Given Verify execution of below scenarios is successful
      | Install repo solution pack - BFA |
    Given Navigate to page "/content-hub/all-content/"
    Then Verify User Navigated to Content Hub Discover tab
    When Search content hub item "Brute Force Attack Response"
    Then Verify visibility of content hub item
      | Solution Pack | Brute Force Attack Response |
    When Click "Solution Pack" tile "Brute Force Attack Response"
    Then Verify "Brute Force Attack Response" configuration page opens
    And Verify Visible text
      | Text Type | Text to Search  | Tag    |
      | Button    | Delete Template | button |
    When Click button "Delete Template"
    Then Verify Visible text
      | Text Type    | Text to Search                  | Tag  |
      | Popup header | Solution Pack Template Deletion | span |
    When Click button "Yes"
    Then Verify "Brute Force Attack Response" configuration page opens
    And Verify Visible text
      | Text Type | Text to Search | Tag    |
      | Button    | Install        | button |


  Scenario: Create a custom SP and Save as Draft to workspace
    Given Import Playbook Collection "BulkCollection_RB.json"
    Given Navigate to page "/content-hub/workspace/"
    Then Verify "Create" tab is active
    When Click button "Create"
    Then Verify visible text
      | Text Type | Text to Search    | Tag  |
      | Text Type | New Solution Pack | span |
    Then Click NewSolutionPack dropdown value
    Then Verify "Start" tab is highlighted
    Then Verify "About Solution Pack" tab is not highlighted
    Then Click button "Let's start by defining a solution pack"
    Then Enter "My Custom SP UI Automation" in field "Solution Pack Name"
    Then Enter "9.9.9" in field "Version"
    Then Verify visible text
      | Text Type           | Text to Search | Tag   |
      | Configuration label | Publisher      | label |
    And Enter "UI Auto" in field "Publisher"
    Then Verify visible text
      | Text Type           | Text to Search | Tag   |
      | Configuration label | Compatibility  | label |
    And Enter "7.3.1" in field "Compatibility"
    Then Verify visible text
      | Text Type           | Text to Search | Tag   |
      | Configuration label | Description    | label |
    And Enter "Updated Custom SP by UI Automation script" in TextArea "Description"
    Then Verify visible text
      | Text Type           | Text to Search | Tag   |
      | Configuration label | Support Info   | label |
    And Enter "FortiSOAR QA Team" in TextField Support Info
    Then Verify visible text
      | Text Type           | Text to Search | Tag   |
      | Configuration label | Category       | label |
    And Add "Asset Management" value in dropdown Category on solution pack wizard
    When Click "Category" label
  ##And Add custom tag with value "bfa_auto"
    When Add record details
      | Tags            |
      | CustomSP_UIAuto |
    When Click "Tags" label
    When Click "Continue" button
    Then Verify "Prerequisites" tab is highlighted
    Then Verify "Choose Entities" tab is not highlighted
    Then Verify visible text
      | Text Type            | Text to Search                 | Tag |
      | Configuration header | Add Solution Pack Dependencies | div |
    #When Click "Continue" button
    When Click Continue button on Prerequisites tab
    Then Verify "Choose Entities" tab is highlighted
    Then Verify "Filter Data" tab is not highlighted
    Then Verify visible text
      | Text Type            | Text to Search        | Tag |
      | Configuration header | Select Configurations | p   |
    Then Verify select all checkbox is not selected
    Then Click "Playbooks" label
    #When Click "Continue" button
    When Click continue button on Choose Entities tab of solution pack edit wizard
    Then Verify "Filter Data" tab is highlighted
    Then Verify "Create Solution Pack" tab is not highlighted
    Then Verify Include Everything checkbox is not selected
    Then Verify visible text
      | Text Type   | Text to Search                        | Tag |
      | Page header | Choose Playbook Collections to Export | h4  |
    Then Click "BulkCollection_RB" label
    When Verify entity count is correct on solution pack wizard
      | Entity              | Count |
      | Playbook Collection | 1     |
      | Global Variable     | 0     |
    #When Click "Continue" button
    When Click "Button" "Button_Continue_Filter_Data_EditSolutionPack" on "Filter Data tab" using locator type "id"
    Then Verify "Create Solution Pack" tab is highlighted
    Then Verify visible text
      | Text Type   | Text to Search       | Tag |
      | Page header | Review Solution pack | h3  |
    Then Verify visible text
      | Text Type | Text to Search                                         | Tag  |
      | Text      | 1 Playbook Collection(s)                               | div  |
      | Text      | My Custom SP UI Automation                             | span |
      | Text      | Version: 9.9.9                                         | div  |
      | Text      | Description: Updated Custom SP by UI Automation script | div  |
    When Click button "Save As Draft To Workspace"
    Then Verify toaster message appears
      | Solution Pack created successfully. |
    Then Verify visible text
      | Text Type   | Text to Search                                      | Tag |
      | Page header | Solution Pack Successfully Saved To Your Workspace! | div |
    Then Verify "Download Solution Pack File" button is visible
    When Click button "Download Solution Pack File"
  ##can't find downloaded file path on mac--->>Then Verify file "FortiSOAR-My Custom SP UI Automation-9.9.9-202301240524" is downloaded
  ##To close the Solution Pack Wizard
    Then Close Record Detail View
  ##The created custom sp tile must be present Under Create tab
    Then Verify visibility of content hub item
      | Solution Pack | My Custom SP UI Automation |


  Scenario: Verify Custom SP is present in workspace
    Given Verify execution of below scenarios is successful
      | Create a custom SP and Save as Draft to workspace |
    Given Navigate to page "/content-hub/workspace/"
   ####The custom sp tile must be present Under Create tab
    Then Verify "Create" tab is active
    Then Search content hub item "My Custom SP UI Automation"
    Then Verify visibility of content hub item
      | Solution Pack | My Custom SP UI Automation |


  Scenario: Delete custom SP from Create tab
    Given Verify execution of below scenarios is successful
      | Create a custom SP and Save as Draft to workspace |
    Given Navigate to page "/content-hub/workspace/"
    Then Search content hub item "My Custom SP UI Automation"
    And Wait for specified time
      | 2 |
    When Click Delete icon
    Then Verify Visible text
      | Text Type    | Text to Search                                     | Tag  |
      | Popup header | Are you sure you want to delete the Solution Pack? | span |
    #added wait for running on 7.3.1

    Then Click button "Confirm"
    ## Deleted custom sp created from create tab must not be visible under create tab
    Then Search content hub item "My Custom SP UI Automation"
    Then Verify visible text
      | Text Type | Text to Search   | Tag |
      | Text      | No results found | i   |


  Scenario: Sort Content Hub Tiles
    Given Navigate to page "/content-hub/all-content/"
    When Select "Connectors" checkbox
    And Select "Analytics and SIEM" checkbox
    Then Verify filter tag "Connectors" is visible
    Then Verify filter tag "Analytics and SIEM" is visible
    Then Verify visible text
      | Text Type | Text to Search | Tag    |
      | Dropdown  | Sort: A-Z      | select |
    When Set content sorting dropdown value as "Sort: A-Z"
    Then Verify display order of content tiles
      | Connector | AlienVault USM Anywhere |
      | Connector | Fortinet FortiSIEM      |
    When Set content sorting dropdown value as "Sort: By Date"
    Then Verify display order of content tiles
      | Connector | Fortinet FortiSIEM      |
      | Connector | AlienVault USM Anywhere |
    When Navigate to page "content-hub/all-content/?contentType=solutionpack"
    Then Verify filter tag "Solution Packs" is visible
    When Set content sorting dropdown value as "Sort: A-Z"
    Then Verify display order of content tiles
      | Solution Pack | ChatOps             |
      | Solution Pack | CSV Data Management |
    When Set content sorting dropdown value as "Sort: By Date"
    Then Verify display order of content tiles
      | Solution Pack | CSV Data Management |
      | Solution Pack | ChatOps             |
    When Navigate to page "/content-hub/all-content/?contentType=widget"
    Then Verify filter tag "Widgets" is visible
    When Set content sorting dropdown value as "Sort: A-Z"
    Then Verify display order of content tiles
      | Widget | Access Control          |7
      | Widget | Custom Picklist Message |
    When Set content sorting dropdown value as "Sort: By Date"
    Then Verify display order of content tiles
      | Widget | Custom Picklist Message |
      | Widget | Access Control          |


  Scenario: Import Solution Pack
    ##Navigate to Manage Tab to upload solution pack
    Then Navigate to page "content-hub/my-content/"
    Then Verify "Manage" tab is active
    When Click button "Upload"
    Then Click "Upload Solution Pack" dropdown value
    Then Verify visible text
      | Text Type | Text to Search       | Tag  |
      | Text Type | Upload Solution Pack | span |
    When Select file
      | FileName                 | FilePath |
      | UI_Auto_SP_Import_01.zip |          |
    Then Verify "UI_Auto_SP_Import_01" configuration page opens
    And Verify Visible text
      | Text Type | Text to Search | Tag    |
      | Text      | Knowledge Base | h5     |
      | Button    | Install        | button |
    When Click "Install" button
    Then Verify Visible text
      | Text Type    | Text to Search                     | Tag  |
      | Popup header | Confirm Solution Pack Installation | span |
    When Click "Confirm" button
    Then Verify Visible text
      | Text Type    | Text to Search                               | Tag |
      | Popup header | Install Solution Pack - UI_Auto_SP_Import_01 | h3  |
    Then Wait for solution pack installation to complete
      | Polling Timeout (In Seconds) |
      | 200                          |
   ##The published solution pack must be present Under Manage tab
    Then Verify "Manage" tab is active
    When Search content hub item "UI_Auto_SP_Import_01"
    Then Verify Visible text
      | Text Type     | Text to Search       | Tag |
      | Solution Pack | UI_Auto_SP_Import_01 | h4  |
    When Click "Solution Pack" tile "UI_Auto_SP_Import_01"
    Then Verify "UI_Auto_SP_Import_01" configuration page opens
    Then Verify Delete Template button is visible
    And Verify solution pack dependencies are installed
      | Knowledge Base |
    Then Close Record Detail View
  ##module verification along with playbook verification .Also verify code snippet connector action execution and notifications
    When Navigate to page "/modules/u_i_auto_alerts"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page header | UIAutoAlerts   | span |
    Then Verify grid record count is "2"
    When Click row "1" of grid
    Then Click button "Execute"
    Then Verify Search Playbook field displayed
    Then Verify Playbook is available for execution
      | Auto Alert PB 01 |
    When Select Playbook from execution window
      | Auto Alert PB 01 |
    Then Verify toaster message appears
      | Triggered action "Auto Alert PB 01" on 1 record. |
 ##Wait for PB execution to be complete
    When Wait for specified time
      | 3 |
    Then Verify UI_Auto_Alert record alert severity is "High"
    Then Close Record Detail View
  ##notification verification on alert update
    When Click Notification bell icon
    Then Verify visible text
      | Text Type | Text to Search                                                | Tag |
      | Text      | An alert, Auto_01, has been updated by UI Automation Script ! | p   |
    Then Click "View UI Auto Alerts" link
    Then Verify UI_Auto_Alert record alert severity is "High"
  ##Knowledge Base Solution Pack installed as dependency verification
    When Navigate to page "/modules/knowledge_base"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page header | Knowledge Base | span |
    Then Verify grid record count is "12"
  ##Dashboard Verification
    When Navigate to page "/dashboard"
    When Select the dashboard
      | Auto_SP_Test_Dashboard_01 |
    Then Verify record count is "2" with text "Auto_BFA" in card count widget
   ##Report Verification /reporting/library
    When Navigate to page "/reporting/library"
    Then Verify Reporting Page is displayed
    When Search report by report name "Auto_SP_Test_Report_01"
    Then Verify report "Auto_SP_Test_Report_01" is visible to the user
    When Click View Report button for report "Auto_SP_Test_Report_01"
    Then Verify report "Auto_SP_Test_Report_01" loads
    Then Verify record count is "2" with text "Auto_BFA" in card count widget


  Scenario: Delete template of imported solution pack
    Given Verify execution of below scenarios is successful
      | Import Solution Pack |
    Given Navigate to page "content-hub/my-content/"
    Then Verify "Manage" tab is active
    When Search content hub item "UI_Auto_SP_Import_01"
    Then Verify visibility of content hub item
      | Solution Pack | UI_Auto_SP_Import_01 |
    When Click "Solution Pack" tile "UI_Auto_SP_Import_01"
    Then Verify "UI_Auto_SP_Import_01" configuration page opens
    And Verify Visible text
      | Text Type | Text to Search  | Tag    |
      | Button    | Delete Template | button |
    When Click button "Delete Template"
    Then Verify Visible text
      | Text Type    | Text to Search                         | Tag  |
      | Popup header | Custom Solution Pack Template Deletion | span |
    When Click button "Yes"
      ##Deleted template of imported custom solution pack must be available neither on manage tab nor in discover tab
    Then Navigate to page "content-hub/my-content/"
    When Search content hub item "UI_Auto_SP_Import_01"
    Then Verify Visible text
      | Text Type | Text to Search   | Tag |
      | Button    | No results found | div |
    And Navigate to page "content-hub/all-content/"
    When Search content hub item "UI_Auto_SP_Import_01"
    Then Verify Visible text
      | Text Type | Text to Search   | Tag |
      | Button    | No results found | div |




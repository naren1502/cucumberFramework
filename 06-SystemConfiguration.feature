@Regression
Feature: System Configuration

   @Sanity
  Scenario: Collapse Navigation

     And Collapse navigation "enabled" by api call
    When Navigate to page "/system/system-configuration/application-configuration"
    Then Verify Save and Revert button Disabled
    When Deselect Collapse Navigation checkbox
    When Save System Configuration
    Then Verify Navigation panel Expands
    Then Verify Save and Revert button Disabled
    When Select Collapse Navigation checkbox
    When Save System Configuration
    Then Verify Navigation panel collapsed


  Scenario: Edit System Format For Contact Number
    When Navigate to page "/system/system-configuration/application-configuration"
    Then Verify Visible text
      | Text Type   | Text to Search       | Tag |
      | Page Header | System Configuration | h1  |
    Then Verify Phone Number label is displayed
    Then Verify United States Default Country is Selected
    When Click Default Country
    When Select India
    Then Verify India is Selected
    Then Verify save button is enabled
    When Save System Configuration
    Then Verify Toaster message displayed
    When Navigate to Users page
    When Click on cs admin User
    Then Verify Home phone Country is set as India
    Then Verify Mobile Phone Country is set as India
    Then Verify Fax Phone Country is set as India
    Then Verify Work Phone Country is not set as India for csadmin user
    When Click on Cancel Button
    Then Click Add Person button
    Then Verify Home phone Country is set as India
    Then Verify Mobile Phone Country is set as India
    Then Verify Fax Phone Country is set as India
    Then Verify Work Phone Country is set as India

   @Sanity
  Scenario: Update Product Name and Branding Taglines
    Given Navigate to page "/system/system-configuration/branding"
    When Update Product Name
    When Remove Branding Tagline
    Then Verify Tagline2 is removed
    When Remove Branding Tagline
    Then Verify Tagline1 is removed
    When Add Branding Tagline
    Then Verify new Branding Tagline is added
    When Save System Configuration
    Then Verify toaster message appears
      | Branding changes saved successfully |
    When Save new product name to appspec property
    When Navigate to page "/logout"
    Then Verify updated Product Name is displayed
    Then Verify updated Branding Tagline is displayed


  Scenario: Enable Cluster Health Notification checkbox
    Given Verify execution of below scenarios is successful
      | Change default credentials for Admin User |
    Given Navigate to page "/logout"
    When Login to FortiSOAR
      | Username | Password     |
      | csadmin  | UserPassword |
    When Click Setting Button
    Given System configuration page is displayed
    Then Verify System and Cluster Health Monitoring checkbox is disabled
    When Click Enable Notification checkbox
    Then Verify Default Service is SMTP
    Then Verify Email field is blank
    When Add Email address
    Then Verify required field notification disappears
    Then Verify default monitor interval
      | 5 |
    When Update Monitor interval
    Then Save System Configuration
    Then Verify toaster message appears
      | Application configuration saved successfully. |
    Then Verify default System Health Thresholds
    When Compare Unix Log File
      | FileName | NumberOfLines | SearchKey                                    |
      | ha       | 2             | Refreshed the heartbeat_interval to -r- mins |

  @Open_Bug #898901
  Scenario: Availability of System Fixture links
    Given Verify execution of below scenarios is successful
      | Change default credentials for Admin User |
    When Navigate to page "/system/system-configuration/fixtures"
    When Capture FortiSOAR tab handle
    When Click "Approval/Manual Task Playbooks" collection link
    Then Verify Visible text
      | Text Type    | Text to Search                 | Tag |
      | Popup Header | Approval/Manual Task Playbooks | p   |
    When Switch back to FortiSOAR tab handle
    When Click "Schedule Management Playbooks" collection link
    Then Verify Visible text
      | Text Type    | Text to Search                | Tag |
      | Popup Header | Schedule Management Playbooks | p   |
    When Switch back to FortiSOAR tab handle
    When Click "Report Management Playbooks" collection link
    Then Verify Visible text
      | Text Type    | Text to Search              | Tag |
      | Popup Header | Report Management Playbooks | p   |
    When Switch back to FortiSOAR tab handle
    When Click "Password Reset Token" link
    Then Verify Password Reset Token template is displayed
    When Switch back to FortiSOAR tab handle
    When Click "Send Email To New User" link
    Then Verify Send Email To New User is displayed
    When Switch back to FortiSOAR tab handle
    When Click "Send Email For Password Change" link
    Then Verify Send Email For Password Change template is displayed
    When Switch back to FortiSOAR tab handle
    When Click "Send Email For Reset Password By Admin" link
    Then Verify Send Email For Reset Password By Admin template is displayed
    When Switch back to FortiSOAR tab handle


  Scenario: Playbook execution log level changes

    Given Verify execution of below scenarios is successful
      | Change default credentials for Admin User |
    Given Navigate to page "/system/system-configuration/application-configuration"
    Then System configuration page is displayed
    When Select PB execution log level "DEBUG"
    When Unselect allow individual playbook level logging checkbox
    Then Click "Save" button
    When Import Playbook Collection "LogLevelVerification.json"
    Then Navigate to page "/modules/alerts"
    When Click "Execute" button
    When Wait for specified time
      | 5 |
    Then Verify Search Playbook field displayed
    Then Verify Playbook is available for execution
      | Validate Log Level |
    When Select Playbook from execution window
      | Validate Log Level |
    Then Verify toaster message appears
      | Triggered action "Validate Log Level". |
    Then Click executed playbook logs
    Then Search playbook in executed playbook logs
      | Validate Log Level |
    Then Verify execution mode on execution history is "DEBUG"
    When Click Setting Button
    Then System configuration page is displayed
    When Select PB execution log level "INFO"
    Then Click "Save" button
    Then Navigate to page "/modules/alerts"
    When Click "Execute" button
    When Wait for specified time
      | 5 |
    Then Verify Search Playbook field displayed
    Then Verify Playbook is available for execution
      | Validate Log Level |
    When Select Playbook from execution window
      | Validate Log Level |
    Then Verify toaster message appears
      | Triggered action "Validate Log Level". |
    Then Click executed playbook logs
    Then Search playbook in executed playbook logs
      | Validate Log Level |
    Then Verify execution mode on execution history is "INFO"

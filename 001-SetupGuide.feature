@Regression
Feature: SetupGuide

Scenario: Setup Guide is displayed when user logs in for the first time
  Given  "Title Text" "SetupGuideTitle" is present on "Setup Guide Pop Up"
  And "Description text" "SetupGuideDescription" is present on "Setup Guide Pop Up"
  And "Link to open setup guide" "SetupGuideOpenButton" is present on "Setup Guide Pop Up"
  When Click "button" "SetupGuideOpenLaterButton" on "Setup Guide Pop Up"
  Then "Pop Up" "SetupGuidePopUp" is not present on "Dashboard Page"

  Scenario: Verify disabling and enabling the setup guide option
    When Click Setting Button
    Then System configuration page is displayed
	# De selecting the Setup guide checkbox
    When Click "Enable Setup Guide" label
    When Save System Configuration
    Then Verify SetupGuide option is removed
	# Selecting the Setup guide checkbox
    When Click "Enable Setup Guide" label
    When Save System Configuration
    Then Verify SetupGuide option is available


  Scenario: Verify status of setup guide tasks
    Given Verify execution of below scenarios is successful
      | Verify disabling and enabling the setup guide option |
    Given Verify SetupGuide option is available
    When Click SetupGuide button
    Then Verify Visible text
      | Text Type    | Text to Search     | Tag   |
      | Window Label | Select Setup Guide | label |
    When Click "Production" label
    Then Verify Visible text
      | Text Type    | Text to Search                               | Tag  |
      | Window Label | Check below guide for Production Environment | span |
    Then Verify status of setup guide tasks
      | Review the Sizing and Configuration                            | Incomplete |
      | Setup Data Protection (Backup, HA and DR)                      | Incomplete |
      | Replace the Self-Signed Certificates                           | Incomplete |
      | Setup Network Proxy                                            | Incomplete |
      | Create Users, Teams, and Roles                                 | Incomplete |
      | Segmented Network Configuration                                | Incomplete |
      | Additional Settings                                            | Incomplete |
      | Setup Data Ingestion                                           | Incomplete |
      | Configure Enrichment and Mitigation Playbooks                  | Incomplete |
      | Dashboards and Reports                                         | Incomplete |
      | Define Notification Rules                                      | Incomplete |
      | Configure additional use-cases                                 | Incomplete |
      | Create your own response playbooks                             | Incomplete |
      | Setup System Monitoring                                        | Incomplete |
      | Setup Playbooks and Audit Log Purging                          | Incomplete |
      | Set up CI-CD between your development and production instances | Incomplete |
      | Retain Data for Audit                                          | Incomplete |

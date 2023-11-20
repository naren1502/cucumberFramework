Feature: Connector Configuration on Agent

  @SNS
    Scenario: Connector Configuration on Agent
    When Navigate to page "/content-hub/my-content/"
    Then Verify "Manage" tab is active
    When Search by Connector Name
    |ThreatIntelConnector|
    Then Verify connector gets searched
    |ThreatIntelConnector|
    When Click on Connector
    |ThreatIntelConnector|
    Then Verify Connector is Active
    Then Verify Agent Configuration Button is Enabled
    When Click Agent Configuration Button
    Then verify Agent Configuration is displayed
    Then Verify Agent is Selected
    When Click to Add New connector Configuration
    When Enter Configuration Name
    Then Verify Server URL Value
    When Enter API Key
    When Select Default Configuration Checkbox
    Then Verify Save Button is enabled
    When Click Save Connector Config Button
    Then Verify Configuration saved successfully
    Then Verify Health Check is available    


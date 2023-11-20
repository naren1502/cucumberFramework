Feature: SNS-Connector Installation on Base and Agent

  @SNS
  Scenario: SNS-Connector Installation on Base
    When Navigate to page "/connectors"
    Then Verify "Manage" tab is active
    When Search by Connector Name
      | ThreatIntelConnector |
    Then Verify connector gets searched
      | ThreatIntelConnector |
    When Click on Connector
      | ThreatIntelConnector |
    Then Verify Connector detail is displayed
      | ThreatIntelConnector |
    Then Verify Connector is Active
    Then Verify Uninstall Button is displayed

  @SNS
  Scenario: SNS-Connector Installation on Agent
    Given Verify Agent Tab is dispalyed
    When Click on Agent Tab
    Then Verify Install Connector On New Agent button displayed
    When Click on Install Connector On New Agent button
    Then Verify Agents Pop up Window displayed
    Then Verify Agent is displayed in Grid
    Then Verify install button is displayed
    Then verify Cancel button is displayed
    Then Select record no "1" from grid
    When Click on Install Button on Agents
    Then Verify Agent Name is displayed
    Then Verify Connector status is Installed Active
    Then Verify Deactivate Connector Button is displayed
    Then Verify Delete Button is displayed

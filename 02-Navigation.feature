@Regression
Feature: Navigation panel Link are working

  Background: Expand navigation from global settings
    Given Feature set up - Expand navigation


   @Sanity
  Scenario: Navigate to Queue Management
    When Click Queue and Shift Management
    Then Verify User Navigated to Queue and Shift Management

   @Sanity
  Scenario: Navigate to Alerts
    Given Incident Response is displayed
    When Click Incident Response
    When Click Alerts
    Then Verify User Navigated to Alerts

   @Sanity
  Scenario: Navigate to Incidents
    Given Incident Response is displayed
    When Incidents is displayed
    Then Click Incidents
    Then Verify User Navigated to Incidents

   @Sanity
  Scenario: Navigate to Tasks
    Given Incident Response is displayed
    When Tasks is displayed
    Then Click Tasks
    Then Verify User Navigated to Tasks

   @Sanity
  Scenario: Navigate to Indicators
    Given Incident Response is displayed
    When Indicators is displayed
    Then Click Indicators
    Then Verify User Navigated to Indicators

   @Sanity
  Scenario: Navigate to War Rooms
    Given Incident Response is displayed
    When War Rooms is displayed
    Then Click War Rooms
    Then Verify User Navigated to War Rooms

   @Sanity
  Scenario: Navigate to Playbooks
    Given Automation is displayed
    When Click Automation
    Then Verify Playbooks is displayed
    When Click Playbooks
    Then Verify User Navigated to Playbooks

   @Sanity
  Scenario: Navigate to Data Ingestion
    Given Automation is displayed
    When Data Ingestion is displayed
    Then Click Data Ingestion
    Then Verify User Navigated to Data Ingestion

   @Sanity
  Scenario: Navigate to Schedules
    Given Automation is displayed
    When Schedules is displayed
    Then Click Schedules
    Then Verify User Navigated to Schedules

   @Sanity
  Scenario: Navigate to SLA Templates
    Given Automation is displayed
    When SLA Templates is displayed
    Then Click SLA Templates
    Then Verify User Navigated to SLA Templates

   @Sanity
  Scenario: Navigate to Connectors
    Given Automation is displayed
    When Connectors is displayed
    Then Click Connectors
    Then Verify User Navigated to Content Hub Manage tab

   @Sanity
  Scenario: Navigate to Attachments
    Given Resources is displayed
    When Click Resources
    When Click Attachments
    Then Verify User Navigated to Attachments

   @Sanity
  Scenario: Navigate to Assets
    Given Resources is displayed
    When Assets is displayed
    Then Click Assets
    Then Verify User Navigated to Assets

   @Sanity
  Scenario: Navigate to Email Templates
    Given Resources is displayed
    When Email Templates is displayed
    Then Click Email Templates
    Then Verify User Navigated to Email Templates

   @Sanity
  Scenario: Navigate to Reports
    Given Reports is displayed
    When Click Reports
    Then Verify User Navigated to Reports

   @Sanity
  Scenario: Navigate to Recycle Bin
    Given Recycle Bin is displayed
    When Click Recycle Bin
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Recycle Bin    | span |


Feature: SNS_PlaybookExecution

  @SNS
  Scenario: Playbook with connector actions on Agents
    When Import SNS Playbook Collection
    When Navigate to page "/playbooks/collections"
    When Search SNS Playbook Collection
    Then Verify SNS Playbook Collection is searched
    When Click SNS Playbook Collection
    Then Verify below grid records are present on grid
      | Name   |
      | SNS PB |
    When Click SNS Playbook
    Then Verify Manual Trigger Step is added
    When Drag new step from existing step "Start"
    Then Verify Steps are displayed
    When Click Connector step
    Then Connector Search field displayed
    When Search for connector
    Then Searched connector displayed
    When Searched connector clicked
    Then Connector step details page displayed
    When Enter Connector step details
    When Click Step Save button
    Then Verify Connector Step is added
    When Save Playbook button is enabled
    Then Verify Click Save Playbook
    Then Verify Playbook save Toaster message
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click on Add Alert
    And Add record details
      | Name                                |
      | AlertCreatedForSNSPlaybookExecution |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForSNSPlaybookExecution |
    When Click Execute Button
    Then Verify Search Playbook field displayed
    When Search Playbook in Search field
    Then Verify Playbook is Searched
    When Select Playbook
    Then Verify Playbook execution toaster message
    When Click Playbook Execution logs button
    Then Verify Executed Playbook log page displayed
    Then Verify Executed playbook present in log page
    Then Verify Status of the Executed playbook is passed
    When Click connector step in log
    Then Verify Connector Output tab is displayed


@Regression
Feature: Correlation Settings


  Scenario: Verify default correlation settings
    When Click Setting Button
    Then Verify Visible text
      | Text Type | Text to Search       | Tag |
      | Link      | Correlation Settings | a   |
    When Click "Correlation Settings" link
    Then Verify Visible text
      | Text Type   | Text to Search              | Tag |
      | Page header | Visual Correlation Settings | h1  |
    Then Verify configured modules count is "6"
    Then Verify the configured modules names
      | Alerts     |
      | Assets     |
      | War Rooms  |
      | Incident   |
      | Indicators |
      | Tasks      |
    When Click "Incidents" module
    Then Verify related modules tags for "Incidents" module
      | Assets          |
      | Indicators      |
      | Vulnerabilities |
      | Alerts          |
    Then Verify "Incidents" module "Node Label" dropdown default value is "Name"
    Then Verify "Incidents" module "Node Shape" dropdown default value is "Custom Icon"
    Then Verify "Incidents" module "Node Color" dropdown default value is "Severity"
    Then Verify remove configuration link is visible


  Scenario: Verify non correlated modules are not displayed in correlated map
    When Navigate to page "/modules/incidents"
    Then Incident Page is displayed
    When Click Add record button
    When Enter "Incident created for correlation verification" in field "Name"

    When Click "Save" button
    Then Verify toaster message appears
      | You have created "Incident created for correlation verification". |
    Then Verify graph elements
      | Incidents |
    Then Verify absence of graph elements
      | Tasks |
    When Correlations tab is displayed
    When Click "4" under "Tasks" tab of relationship widget
    When Click Add Tasks button
    When Enter "Test task for correlation verification" in field "Name"

    When Click "Create" button

    Then Verify grid record count is "1"
    When Refresh graph elements

    Then Verify graph elements
      | Incidents |
    Then Verify absence of graph elements
      | Tasks |



  Scenario: Update correlation settings and verify changes
    Given Verify execution of below scenarios is successful
      | Verify non correlated modules are not displayed in correlated map |
    When Navigate to page "/editor/correlation-settings"
    Then Verify Visible text
      | Text Type   | Text to Search              | Tag |
      | Page header | Visual Correlation Settings | h1  |
    When Click "Incidents" module

    When Set dropdown "Choose Related Modules" value to "Tasks" of "Incidents" Module
    And Add related module of "Incidents"
    Then Verify related modules tags for "Incidents" module
      | Assets          |
      | Indicators      |
      | Vulnerabilities |
      | Alerts          |
      | Tasks           |
    When Click "Tasks" module

    When Set dropdown "Choose Related Modules" value to "Incidents" of "Tasks" Module
    And Add related module of "Tasks"
    When Set dropdown "Node Label" value to "ID" of "Tasks" Module
    When Set dropdown "Node Shape" value to "Ellipse" of "Tasks" Module
    When Set dropdown "Node Color" value to "Status" of "Tasks" Module
    And Click "Save" button
    Then Verify toaster message appears
      | Correlation setting saved successfully. |
    Then Verify configured modules count is "6"
    Then Verify the configured modules names
      | Alerts     |
      | Assets     |
      | Incident   |
      | Indicators |
      | Tasks      |
      | War Rooms  |
    When Navigate to page "/modules/incidents"
    Then Incident Page is displayed
    When Filter grid column "Name" by entering "Incident created for correlation verification" in column level search box filter
    And Verify correct record is fetched
      | ColumnName | Value                                         |
      | Name       | Incident created for correlation verification |
    When Click row "1" of grid
    Then Verify graph elements
      | Incidents |
      | Tasks     |


@Regression
Feature: ModuleNavigation


  Scenario: Create New Page
    When Click Setting Button
    Then Verify Navigation is displayed
    When Click on Navigation
    Then Verify Pages is displayed
    When Click on Pages
    Then Verify Add more is displayed
    When Click on Add more
    Then Verify Page input fields are displayed
    When Enter Page fields details
    Then Verify Add Page button is enabled
    When Click "Add page" button
    Then Verify toaster message appears
      | added successfully |
    Then Verify New page added in list


  Scenario: Add Page as Group in navigation
    Given Verify execution of below scenarios is successful
      |Create New Page|
    Given Reload the webpage
    And Click tab "Pages"
    Then Verify Add As Group button is disabled
    When Select Page checkbox
    Then Verify Add As Group button is enabled
    When Click button Add As Group
    Then Verify Visible text
      |Text Type|Text to Search|Tag|
      |Page header|Untitled|span|
    When Click group title edit
    When Enter title name for group
    Then Verify icon selection is enabled
    When Select icon for navigation
    Then Verify click on group edit save option
    When Click page edit
    Then Verify icon selection is enabled
    When Select icon for navigation
    Then Verify click on page edit save option
    When Click "Save" button
    Then Verify page group is added in navigation
    When Capture FortiSOAR tab handle
    And Expand navigation
    Then Verify page can be opened from navigation
    When Switch back to FortiSOAR tab handle
    Then Verify Visible text
      |Text Type|Text to Search|Tag|
      |Page header|Navigation|h1|


  Scenario: Select multiple module and add as Group
    Given Navigate to page "/editor/navigation"
    Given Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page header | Navigation     | h1  |
    When Click tab "Modules"
    Then Verify Modules are displayed
    When Select Modules checkbox
    Then Verify Add As Group button is enabled
    When Click button Add Module As Group
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page header | Untitled       | span |
    When Click group title edit
    When Enter title name for module group
    Then Verify icon selection is enabled
    When Select icon for module group navigation
    When Verify click on group edit save option for modules
    When Click "Save" button
    Then Verify page group is added in navigation
    Then Navitgate to modules added in group
    Then Verify Visible text
      |Text Type|Text to Search|Tag|
      |Page title|Agents|span|


  Scenario: Deleting a Group from Navigation page
  #This test case also verifies Revert functionality
    Given Verify execution of below scenarios is successful
      |Add Page as Group in navigation|
    Given Navigate to page "/editor/navigation"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page header | Navigation     | h1  |
    When Click on Remove Page group
    Then Verify Revert button is enabled
    When Click "Revert" button
    Then Verify Remove Page group option is displayed
    When Click on Remove Page group
    Then Click "Save" button
    Then Verify Page group is removed from Navigation


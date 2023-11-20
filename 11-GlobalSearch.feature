@Regression
Feature: GlobalSearch

   @Sanity
  Scenario: Search a record with global search
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click on Add Alert
    Then Alert creation form is displayed
    When Add record details
      | Name                                      | Tags        |
      | AlertCreatedWithCustomTagsForGlobalSearch | CustomAlertTagForGlobalSearch |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedWithCustomTagsForGlobalSearch". |
    Then Navigate to page "/modules/alerts"
    When Global Search is displayed;
    Then Clear Global Search field
    When Enter "AlertCreatedWithCustomTagsForGlobalSearch" text in Global Search box
    Then Verify Search Results page is displayed
    Then Verify more than 0 records are displayed
    And Verify searched record is "displayed" on global search page
      | Module Name | Field Name | Value                                     |
      | Alert       | Name       | AlertCreatedWithCustomTagsForGlobalSearch |



  Scenario: Verify SORT By - Relevance is selected by default
    Given Verify execution of below scenarios is successful
    |Search a record with global search|
    Given Verify Search Results page is displayed
    And Verify Visible text
      | Text Type | Text to Search | Tag |
      | Link      | Relevance      | a   |


  Scenario: Search a record with global search with multiple search items
    Given Navigate to page "/modules/alerts"
    And Global Search is displayed
    When Enter "ManualAction" text in Global Search box
    And Select global search type dropdown as "Broad Search"
    Then Verify more than 0 records are displayed
    When Enter "Hunt" text in Add Search Term box
    Then Verify more than 0 records are displayed


  Scenario: Search a record with pre existing tags in global search
    Given Navigate to page "/modules/alerts"
    When Global Search is displayed
    And Enter "classify" text in Global Search box
    And Select global search type dropdown as "Broad Search"
    Then Verify Search Results page is displayed
    Then Verify more than 0 records are displayed
    When Open the record with tag "classify"
    Then Verify Visible text
      | Text Type    | Text to Search | Tag  |
      | Playbook Tag | classify       | span |


  Scenario: Search a record with custom tags in global search
    Given Verify execution of below scenarios is successful
      |Search a record with global search|
    And Navigate to page "/modules/alerts"
    When Global Search is displayed
    And Enter "CustomAlertTagForGlobalSearch" text in Global Search box
    And Select global search type dropdown as "Broad Search"
    Then Verify Search Results page is displayed
    Then Verify more than 0 records are displayed
    When Open the record with tag "CustomAlertTagForGlobalSearch"
    Then Verify Visible text
      | Text Type | Text to Search | Tag  |
      | Alert Tag | CustomAlertTagForGlobalSearch    | span |



  Scenario: Unchecking the module from the filter
    Given Verify execution of below scenarios is successful
      |Search a record with global search|
    When Navigate to page "/modules/alerts"
    And Global Search is displayed
    And Enter "CustomAlertTagForGlobalSearch" text in Global Search box
    And Select global search type dropdown as "Broad Search"
    Given Verify Search Results page is displayed
    And Search Term "CustomAlertTagForGlobalSearch" is present
    And Verify more than 0 records are displayed
    When "Unselect" checkbox "Alerts"
    Then Verify grid record count is "0"


  Scenario: Checking the module from the filter
    Given Verify execution of below scenarios is successful
      | Unchecking the module from the filter |
    Given Verify Search Results page is displayed
    And Search Term "CustomAlertTagForGlobalSearch" is present
    When Click "All" link
    Then Verify checkbox "Alerts" is "selected"
    And Verify Search Results page is displayed
    And Verify more than 0 records are displayed


  Scenario: Verify filter MATCH TYPE - Broad Search
    Given Verify execution of below scenarios is successful
      | Search a record with global search |
		# Search with alert name - should display the result
		# Search with alert tag - should display the result
		# Broad search is selected by default
    Given Navigate to page "/modules/alerts"
    When Global Search is displayed
    When Enter "CustomAlertTagForGlobalSearch" text in Global Search box
    Given Verify Search Results page is displayed
    And Select global search type dropdown as "Broad Search"
    And Verify Visible text
      | Text Type | Text to Search | Tag |
      | Link      | Broad Search   | a   |
    And Verify searched record is "displayed" on global search page
      | Module Name | Field Name | Value       |
      | Alert       | Tags       | CustomAlertTagForGlobalSearch |
    When Clear Global Search field
    When Enter "AlertCreatedWithCustomTagsForGlobalSearch" text in Global Search box
    And Select global search type dropdown as "Broad Search"
    Then Verify Search Results page is displayed
    And Verify searched record is "displayed" on global search page
      | Module Name | Field Name | Value                                     |
      | Alert       | Name       | AlertCreatedWithCustomTagsForGlobalSearch |


  Scenario: Verify filter MATCH TYPE - Exact Search
    Given Verify execution of below scenarios is successful
      | Search a record with global search |
		# Search with alert name - should display the result
		# Search with alert tag - should NOT display the result
    Given Navigate to page "/modules/alerts"
    When Global Search is displayed
    When Enter "AlertCreatedWithCustomTagsForGlobalSearch" text in Global Search box
    Given Verify Search Results page is displayed
    When Select global search type dropdown as "Exact Text Search"
    Then Verify Visible text
      | Text Type | Text to Search    | Tag |
      | Link      | Exact Text Search | a   |
    When Search Term "AlertCreatedWithCustomTagsForGlobalSearch" is present
    Then Verify Search Results page is displayed
    And Verify searched record is "displayed" on global search page
      | Module Name | Field Name | Value                                     |
      | Alert       | Name       | AlertCreatedWithCustomTagsForGlobalSearch |
    When Clear Global Search field
    When Enter "CustomAlertTagForGlobalSearch" text in Global Search box
    Then Verify Search Results page is displayed
    When Select global search type dropdown as "Exact Text Search"
    And Verify searched record is "not displayed" on global search page
      | Module Name | Field Name | Value       |
      | Alert       | Tags       | CustomAlertTagForGlobalSearch |





  Scenario: Verify Removing search item should refresh the results
    Given Verify execution of below scenarios is successful
      | Search a record with global search |
    Given Navigate to page "/modules/alerts"
    When Global Search is displayed
    When Enter "CustomAlertTagForGlobalSearch" text in Global Search box
    Given Verify Search Results page is displayed
    And Select global search type dropdown as "Broad Search"
    When Click remove search item icon
    Then Verify toaster message appears
      | Please enter a search term. |


  Scenario: Search item should have minimum 3 characters
    Given Navigate to page "/modules/alerts"
    Given Global Search is displayed
    When Enter "al" text in Global Search box
    Then Verify toaster message appears
      | A minimum of 3 characters are required to search. |


  Scenario: Global Search - SORT By - Most recently modified
    Given Create below records for "alerts" module via api call
      | name     |
      | UIAuto01ForGlobalSearchSortValidation |
    #adding wait to change modified on time for different records
    And Wait for specified time
    |1|
    Given Create below records for "alerts" module via api call
      | name     |
      | UIAuto02ForGlobalSearchSortValidation |
      | UIAuto03ForGlobalSearchSortValidation |
      | UIAuto04ForGlobalSearchSortValidation |
    And Wait for specified time
      |1|
    Given Create below records for "alerts" module via api call
      | name     |
      | UIAuto05ForGlobalSearchSortValidation |
    And Reload the webpage
    When Global Search is displayed
    When Enter "ForGlobalSearchSortValidation" text in Global Search box
    Then Verify Search Results page is displayed
    When Select global search type dropdown as "Exact Text Search"
    #Allow search result page to be stable
    And Wait for specified time
      |4|
    When Click "Relevance" label
    And Click "Most Recently Modified" label
    Then Verify Visible text
      | Text Type | Text to Search         | Tag |
      | Link      | Most Recently Modified | a   |
    Then Verify search result contains record with title "UIAuto05ForGlobalSearchSortValidation"


  Scenario: Global Search - SORT By - Least recently modified
    Given Verify execution of below scenarios is successful
      | Global Search - SORT By - Most recently modified |
    Given Navigate to page "/modules/alerts"
    When Global Search is displayed
    When Enter "ForGlobalSearchSortValidation" text in Global Search box
    Then Verify Search Results page is displayed
    When Select global search type dropdown as "Exact Text Search"
    When Click "Relevance" label
    And Click "Least Recently Modified" label
    Then Verify Visible text
      | Text Type | Text to Search    | Tag |
      | Link      | Least Recently Modified | a |
    Then Verify search result contains record with title "UIAuto01ForGlobalSearchSortValidation"

    Scenario: Query based search finds result based on wildcard and logic operators
      Given Navigate to page "/modules/alerts"
      Given Create below records for "alerts" module via api call
        | name                                             | source       |
        | FortiSiemAlertForQueryBasedSearchValidation      | FortiSiem    |
        | FortiAnalyzerAlertForQueryBasedSearchValidation  | FortiAnalyzer|
      When Global Search is displayed
      When Enter "(FortiSiemAlert OR FortiAnalyzerAlert) AND FortiS*" text in Global Search box
      Then Verify Search Results page is displayed
      And Verify searched record is "displayed" on global search page
        | Module Name | Field Name | Value                                     |
        | Alert       | Name       | FortiSiemAlertForQueryBasedSearchValidation |
        | Alert       | Source       | FortiSiem |
      And Verify searched record is "not displayed" on global search page
        | Module Name | Field Name | Value       |
        | Alert       | Source       | FortiAnalyzer |










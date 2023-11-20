@Regression
Feature: Grid Actions


  Scenario: Enable light mode for alerts grid
    When Import Create tasks playbook Collection
    When Navigate to page "/modules/tasks"
    Then Verify User Navigated to Tasks
    When Click "Execute" button
    Then Click to trigger playbook "Create Tasks"
    When Wait for specified time
      | 10 |
    Then Get the count of total items
    When Click grid edit template
    Then Verify Visible text
      | Text Type | Text to Search    | Tag  |
      | Label     | Enable Light Mode | span |
    When Click "Enable Light Mode" label
    When Click Apply Changes button
    Then verify Confirmation pop up comes
    When Wait for specified time
      | 2 |
    When Click Confirm
    Then Verify User Navigated to Tasks
    Then Verify Visible text
      | Text Type | Text to Search       | Tag  |
      | Label     | Get Total Item Count | span |


  Scenario: Verify total grid items are not displayed in light mode
    Given Verify execution of below scenarios is successful
      | Enable light mode for alerts grid |
    When Click "Get Total Item Count" label
    Then Verify total items not displayed



  Scenario: Fetch count of grid items in light mode
    Given Verify execution of below scenarios is successful
      | Enable light mode for alerts grid |
    When Verify items per page value
      | 30 |
    Then Get the Count of grid items in light mode


  Scenario: Verify pagination in light mode grid
    Given Verify execution of below scenarios is successful
      | Enable light mode for alerts grid |
    When Update items per page value
      | 5 |
    When Verify items per page value
      | 5 |
    Then Verify Navigate to last page arrow is disabled
    Then Verify total available pages in Light Mode
    Then Verify arrow links visible on all pages
    Then Verify Navigate to First page arrow is Enabled
    When Click on arrow to navigate to first page
    Then Verify User is on First page


  Scenario: Disable light mode grid and Verify total grid items are displayed in default grid mode
    Given Verify execution of below scenarios is successful
      | Enable light mode for alerts grid |
    When Navigate to page "/modules/tasks"
    Then Verify User Navigated to Tasks
    When Click grid edit template
    Then Verify Visible text
      | Text Type | Text to Search    | Tag  |
      | Label     | Enable Light Mode | span |
    When Click "Enable Light Mode" label
    When Click Apply Changes button
    Then verify Confirmation pop up comes
    When Wait for specified time
      | 2 |
    When Click Confirm
    Then Verify User Navigated to Tasks
    Then Verify total items displayed


  Scenario: Verify pagination in default mode grid
    Given Verify execution of below scenarios is successful
      | Disable light mode grid and Verify total grid items are displayed in default grid mode |
    When Update items per page value
      | 5 |
    When Wait for specified time
      | 2 |
    When Verify items per page value
      | 5 |
    Then Verify Navigate to last page arrow is Enabled
    Then Verify Pagination for each page
    Then Verify Navigate to First page arrow is Enabled
    When Click on arrow to navigate to first page
    #allow grid to load properly
    When Wait for specified time
      | 2 |
    Then Verify User is on First page


  Scenario: Grid Actions - Export Visible Column As Csv for Records in Current page
    Given Verify execution of below scenarios is successful
      | Disable light mode grid and Verify total grid items are displayed in default grid mode |
      #Get number of rows and visible columns in current page to be compared with downloaded csv file
    Given Clear file "list-export.csv" from Download folder
    And Get number of rows and visible columns in current page
    When Click grid hamburger menu
    And Select grid hamburger option "Export visible columns as CSV"
    And Verify Visible text
      | Text Type    | Text to Search                | Tag |
      | Pop Up Title | Export visible columns as CSV | h3  |
    And Click radio button "All records in current page"
    And Click button "Download File"
    Then Verify file "list-export.csv" is downloaded
    And Verify csv file "list-export.csv" is downloaded with expected data


  Scenario: Grid Actions - Export All Column As Csv for records in current page
    Given Verify execution of below scenarios is successful
      | Disable light mode grid and Verify total grid items are displayed in default grid mode |
    Given Clear file "list-export.csv" from Download folder
    Given Click grid hamburger menu
      #Get all columns and full first row data to be compared with downloaded csv file
    And Get all columns and full first row data for "tasks" module
    When Select grid hamburger option "Export all columns as CSV"
    And Verify Visible text
      | Text Type    | Text to Search            | Tag |
      | Pop Up Title | Export all columns as CSV | h3  |
    And Click radio button "All records in current page"
    And Click button "Download File"
    Then Verify file "list-export.csv" is downloaded
    And Verify csv file "list-export.csv" is downloaded with expected data

  @Open_Bug #0901593
  Scenario: Grid Actions - Export All Column As Csv for all records
    Given Verify execution of below scenarios is successful
      | Disable light mode grid and Verify total grid items are displayed in default grid mode |
    Given Clear file "tasks-records.csv" from Download folder
    Given Click grid hamburger menu
      #Get all columns ,total record count full first row data except ID Field to be compared with downloaded csv file
    And Get all columns, total record count and first row data for "tasks" module
    When Select grid hamburger option "Export all columns as CSV"
    And Verify Visible text
      | Text Type    | Text to Search            | Tag |
      | Pop Up Title | Export all columns as CSV | h3  |
    And Click radio button "All records across all pages"
    #Click download file to initiate export process
    And Click button "Download File"
    #Click download file button again after file is exported
    And Click button Download File after export is complete
    Then Verify file "tasks-records.csv" is downloaded
    And Verify csv file "tasks-records.csv" is downloaded with expected data



  Scenario: Grid Actions - Export Visible Column As Csv for all records
    Given Verify execution of below scenarios is successful
      | Disable light mode grid and Verify total grid items are displayed in default grid mode |
    #set global variable to decide number of records that can be exported
    Given Reload the webpage
    When Update global variable "csv_export_max_records" with value "10"
    Given Clear file "tasks-records.csv" from Download folder
    And Click grid hamburger menu
      #Get all visible columns ,total record count full first row data except ID Field to be compared with downloaded csv file
    And Get all visible columns, total number of records to be exported and first row data
    And Select grid hamburger option "Export visible columns as CSV"
    And Verify Visible text
      | Text Type    | Text to Search                | Tag |
      | Pop Up Title | Export visible columns as CSV | h3  |
    And Click radio button "All records across all pages"
    #Click download file to initiate export process
    And Click button "Download File"
    #Click download file button again after file is exported
    And Click button Download File after export is complete
    Then Verify file "tasks-records.csv" is downloaded
    And Verify csv file "tasks-records.csv" is downloaded with expected data



  Scenario: Export visible columns as pdf
    Given Verify execution of below scenarios is successful
      | Disable light mode grid and Verify total grid items are displayed in default grid mode |
    Given Navigate to page "/modules/tasks"
    And Reload the webpage
    And Create below records for "tasks" module via api call
      | name               | status                               |
                                            #uuid of 'In Progress' Status
      | Task Export As PDF | 959021fc-c19d-4aee-8e51-5395c5029719 |
    When Filter grid column "Name" by entering "Task Export As PDF" in column level search box filter
    And Click grid hamburger menu
    And Select grid hamburger option "Export visible columns as PDF"
    #switch to next browser tab as pdf file is opened in new tab
    When Verify exported pdf is opened in new tab



  Scenario: Create advance grid filter
    Given Reload the webpage
    Given Create below records for "tasks" module via api call
      | name                              | status                               |
                                            #uuid of 'In Progress' Status
      | Task Automation Advance Filter 01 | 959021fc-c19d-4aee-8e51-5395c5029719 |
      | Task Automation Advance Filter 02 | 959021fc-c19d-4aee-8e51-5395c5029719 |
    When Click grid filter icon
    And Click button "Create Advanced Filter"
    And Enter "Auto Advance Filter" in field "Name"
    And Verify Visible text
      | Text Type    | Text to Search              | Tag |
      | Pop Up Title | Create Advanced Grid Filter | h3  |
    #Add filter criteria
    And Set condition combination logic for condition group number "1" to "AND"
    And Add condition for condition group number "1" from condition row set "1" with below filter criteria
      | Field  | Operator | Value             |
      | Name   | Contains | Advance Filter 01 |
      | Status | Equals   | In progress       |
    And Click button "Save As System"
    #wait for grid to load

    And Verify Visible text
      | Text Type    | Text to Search                 | Tag   |
      | Pop Up Title | "Auto Advance Filter" applied. | label |
    And Verify grid record count is "1"
    And Verify below grid records are present on grid
      | Name                              | Status      |
      | Task Automation Advance Filter 01 | In progress |
    And Verify below grid records are not present on grid detail view
      | Name                              | Status      |
      | Task Automation Advance Filter 02 | In progress |


  Scenario: Clear advance filter
    Given Verify execution of below scenarios is successful
      | Create advance grid filter |
    When Reload the webpage
      #Set scenario context to compare row number post clearing filter
    Given Get row numbers before applying filter
    And Set grid filter as "Auto Advance Filter"
    And Clear all grid filters
    And Verify grid record count is as expected
    And Verify below grid records are present on grid
      | Name                              | Status      |
      | Task Automation Advance Filter 01 | In progress |
    And Verify below grid records are present on grid
      | Name                              | Status      |
      | Task Automation Advance Filter 02 | In progress |


  Scenario: Edit advance filter
    Given Verify execution of below scenarios is successful
      | Create advance grid filter |
    When Reload the webpage
    And Set grid filter as "Auto Advance Filter"
    And Click applied filter
    And Click edit advance filter
    And Verify Visible text
      | Text Type    | Text to Search              | Tag |
      | Pop Up Title | Update Advanced Grid Filter | h3  |
    And Update condition for condition row set "1" with below filter criteria
      | Field | Operator | Value             |
      | Name  | Contains | Advance Filter 02 |
    And Click button "Save"
    And Verify grid record count is "1"
    And Verify below grid records are present on grid
      | Name                              | Status      |
      | Task Automation Advance Filter 02 | In progress |
    And Verify below grid records are not present on grid detail view
      | Name                              | Status      |
      | Task Automation Advance Filter 01 | In progress |


  Scenario: Delete advance filter
    Given Verify execution of below scenarios is successful
      | Create advance grid filter |
    When Reload the webpage
    And Set grid filter as "Auto Advance Filter"
    And Click applied filter
    And Click button "Delete Advanced Filter"
    Then Verify Visible text
      | Text Type         | Text to Search                                      | Tag  |
      | Confirmation Text | Are you sure you want to delete Auto Advance Filter | span |
    #wait for confirmation pop up to load properly
    And Wait for specified time
      | 1 |
    When Click button "Confirm"
    Then Verify toaster message appears
      | Auto Advance Filter deleted |
    And Verify below grid records are present on grid
      | Name                              | Status      |
      | Task Automation Advance Filter 01 | In progress |
    And Verify below grid records are present on grid
      | Name                              | Status      |
      | Task Automation Advance Filter 02 | In progress |


  Scenario: Save grid filter
    Given Reload the webpage
    And Create below records for "tasks" module via api call
      | name                           | status                               |
                                            #uuid of 'In Progress' Status
      | Task Automation Save Filter 01 | 959021fc-c19d-4aee-8e51-5395c5029719 |
                                            #uuid of 'Open' status
      | Task Automation Save Filter 02 | 7669725a-28cc-4b19-98a3-9ca71e0f88f4 |
    And Filter grid column "Name" by entering "Save Filter 01" in column level search box filter
    When Click grid filter icon
    And Click button "Save Filter"
    And Verify visible text
      | Text Type         | Text to Search  | Tag |
      | Confirmation Text | Save New Filter | h3  |
    And Enter "Auto Grid Filter" in field "Name"
    And Click button "Save"
    Then Verify toaster message appears
      | Auto Grid Filter saved |
    And Verify below grid records are present on grid
      | Name                           | Status      |
      | Task Automation Save Filter 01 | In progress |
    And Verify below grid records are not present on grid detail view
      | Name                           | Status |
      | Task Automation Save Filter 02 | Open   |


  Scenario: Clear grid filter
    Given Verify execution of below scenarios is successful
    |Save grid filter|
    Given Reload the webpage
      #Set scenario context to compare row number post clearing filter
    Given Get row numbers before applying filter
    When Set grid filter as "Auto Grid Filter"
    #Allow filter to be applied
    And Wait for specified time
      | 2 |
    And Clear all grid filters
    And Verify grid record count is as expected
    And Verify below grid records are present on grid
      | Name                           | Status      |
      | Task Automation Save Filter 01 | In progress |
      | Task Automation Save Filter 02 | Open        |


  Scenario: Edit grid filter
    Given Verify execution of below scenarios is successful
    |Save grid filter|
    Given Reload the webpage
    When Set grid filter as "Auto Grid Filter"
    And Click applied filter
      #Clear filter applied Name on grid column
    And Filter grid column "Name" by entering "Save Filter 02" in column level search box filter
    And Set grid dropdown filter "Status" to "Open"
    And Click button "Save Filter"
    Then Verify toaster message appears
      | Auto Grid Filter saved |
    And Verify below grid records are not present on grid detail view
      | Name                           | Status      |
      | Task Automation Save Filter 01 | In progress |
    And Verify below grid records are present on grid
      | Name                           | Status |
      | Task Automation Save Filter 02 | Open   |


  Scenario: Delete saved filter
    Given Verify execution of below scenarios is successful
      |Save grid filter|
    Given Reload the webpage
      #Set scenario context to compare row number post clearing filter
    Given Get row numbers before applying filter
    When Set grid filter as "Auto Grid Filter"
    And Click applied filter
    And Click saved filter dropdown icon
    #Allow dropdown to load
    And Wait for specified time
      | 2 |
    And Click delete from saved filter dropdwon options
    #Allow confirmation pop up to load
    And Wait for specified time
      | 2 |
    And Verify visible text
      | Text Type         | Text to Search                                   | Tag |
      | Confirmation Text | Are you sure you want to delete Auto Grid Filter | h3  |
    And Click button "Confirm"
    Then Verify grid record count is as expected
    And Verify below grid records are present on grid
      | Name                           | Status      |
      | Task Automation Save Filter 01 | In progress |
      | Task Automation Save Filter 02 | Open        |


  Scenario: Add and Remove a column to grid view
    Given Reload the webpage
    And Click grid hamburger menu
    When Select grid hamburger option "Assigned On"
    And Select grid hamburger option "Due By"
    Then Verify the grid have "Assigned On" column
    And Verify "Due By" is not present in column header


  Scenario: Reset columns to default in grid view
    Given Verify execution of below scenarios is successful
    |Add and Remove a column to grid view|
    Given Reload the webpage
    And Click grid hamburger menu
    When Select grid hamburger option "Reset columns to default"
    Then Verify the grid have "Due By" column
    And Verify "Assigned On" is not present in column header



  Scenario: Grid Actions - Bulk edit a picklist field - Change task status
    Given Reload the webpage
    And Filter grid column "Name" by entering "Task Automation Save Filter" in column level search box filter
    And Click grid select all checkbox
    And Click button "Change Status"
    And Select option "Completed" from popover dropdown
    Then Verify toaster message appears
      | Successfully updated 2 records |
    And Verify below grid records are present on grid
      | Name                           | Status    |
      | Task Automation Save Filter 01 | Completed |
      | Task Automation Save Filter 02 | Completed |



  Scenario: Grid Actions - Delete Multiple Records
    Given Reload the webpage
    And Filter grid column "Name" by entering "Task Automation Save Filter" in column level search box filter
    And Click grid select all checkbox
    And Click delete button on grid
    Then Verify visible text
      | Text Type           | Text to Search                                      | Tag  |
      | Delete Confirmation | Are you sure you want to delete the selected record | span |
    When Click button "Confirm"
    Then Verify toaster message appears
      | 2 record(s) deleted |
    Then Verify visible text
      | Text Type       | Text to Search | Tag |
      | Empty Grid Text | No Results     | div |


  Scenario: Grid Actions - Trigger manual playbook from grid action button - Escalate an alert
    Given Navigate to page "/modules/alerts"
    And Create below records for "alerts" module via api call
      | name                                |
      | Alert Automation Escalate From Grid |
    And Filter grid column "Name" by entering "Alert Automation Escalate From Grid" in column level search box filter
    And Click grid select all checkbox
    And Click button "Escalate"
    Then Verify visible text
      | Text Type            | Text to Search | Tag |
      | Escalation Box Title | Escalate       | h3  |
    When Enter "Automation : Alert Escalated From Grid" in field "Incident Name"
    And Set lookup type dropdown field "Incident Lead" to "CS Admin"
    And Set lookup type dropdown field "Incident Type" to "Brute Force Attempts"
    When Click button Escalate on escalation box pop over
    Then Verify toaster message appears
      | Alert - Escalate To Incident" executed successfully on 1 record |
    When Navigate to page "/modules/incidents"
    And Verify below grid records are present on grid
      | Name                                   | Incident Type        | Incident Lead |
      | Automation : Alert Escalated From Grid | Brute Force Attempts | CS Admin      |


  Scenario: Grid Action - Verify changing severity of multiple alerts on grid view
    Given Navigate to page "/modules/alerts"
    And Create below records for "alerts" module via api call
      | name                              | severity                             |
                                        #High Severity
      | Alert Automation Change Severity1 | 40187287-89fc-4e9c-b717-e9443d57eedb |
      | Alert Automation Change Severity2 | 40187287-89fc-4e9c-b717-e9443d57eedb |
      | Alert Automation Change Severity3 | 40187287-89fc-4e9c-b717-e9443d57eedb |
    And Filter grid column "Name" by entering "Alert Automation Change Severity" in column level search box filter

    And Verify below grid records are present on grid
      | Name                              | Severity |
      | Alert Automation Change Severity1 | High     |
      | Alert Automation Change Severity2 | High     |
      | Alert Automation Change Severity3 | High     |
    And Click grid select all checkbox
    When Select Low Severity
    Then Verify toaster message appears
      | Successfully updated 3 records |

    And Verify below grid records are present on grid
      | Name                              | Severity |
      | Alert Automation Change Severity1 | Low      |
      | Alert Automation Change Severity2 | Low      |
      | Alert Automation Change Severity3 | Low      |


  Scenario: Grid Action - Verify resolving multiple alerts on grid view
    Given Navigate to page "/modules/alerts"
    And Create below records for "alerts" module via api call
      | name                     | severity                             |
                                        #High Severity
      | GridAction-ResolveAlert1 | 40187287-89fc-4e9c-b717-e9443d57eedb |
      | GridAction-ResolveAlert2 | 40187287-89fc-4e9c-b717-e9443d57eedb |
      | GridAction-ResolveAlert3 | 40187287-89fc-4e9c-b717-e9443d57eedb |
    And Filter grid column "Name" by entering "GridAction-ResolveAlert" in column level search box filter
    And Click grid select all checkbox
    And Click button "Resolve"
    When Add the alert closure comment
    And Click button "Resolve"
    Then Verify toaster message appears
      | Triggered action "Resolve Alert" on 3 records. |
    When Click grid cell with text "GridAction-ResolveAlert1"
    Then Verify Visible text
      | Text Type | Text to Search     | Tag  |
      | Title     | Alert is Resolved. | span |


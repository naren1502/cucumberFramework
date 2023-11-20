Feature: User Access And Permissions

  @OnHold
  Scenario: Validate default access for Role Application Administrator
    When Navigate to page "/security/roles"
    And Verify Visible text
      | Text Type         | Text to Search | Tag |
      | Roles Page header | Roles          | h1  |
    And Filter grid column "Name" by entering "Application Administrator" in column level search box filter
    And Click row "1" of grid
    Then Verify access rights of modules
      | Application | CRUD |

  @OnHold
  Scenario: Validate default access for Role Full App Permissions
    When Navigate to page "/security/roles"
    And Filter grid column "Name" by entering "Full App Permissions" in column level search box filter
    And Click row "1" of grid
    Then Verify access rights of modules
      | Schedules               | CRUD  |
      | Audit Log Activities    | CRU   |
      | Companies               | CRUD  |
      | Approvals               | CRUD  |
      | Dashboard               | CRUD  |
      | SLA Templates           | CRUD  |
      | Tenants                 | CRUD  |
      | Security                | R     |
      | Vulnerabilities         | CRUD  |
      | Attachments             | CRUD  |
      | Credit Cards            | CRUDE |
      | Widgets                 | CRUDE |
      | Events                  | CRUD  |
      | Assets                  | CRUD  |
      | Emails                  | CRUD  |
      | Files                   | CRUD  |
      | Indicators              | CRUD  |
      | Notes                   | CRUD  |
      | Secure Message Exchange | CRUD  |
      | Saved Reports           | CRUD  |
      | Comment                 | CRUD  |
      | Tasks                   | CRUD  |
      | System Assigned Queues  | CRUD  |
      | Playbooks               | CRUDE |
      | Agents                  | CRUD  |
      | People                  | CRUD  |
      | Incidents               | CRUD  |
      | Reporting               | CRUD  |
      | War Rooms               | CRUDE |
      | Rules                   | CRUD  |
      | Connectors              | CRUDE |
      | Appliances              | CRUD  |
      | Scans                   | CRUD  |
      | Email Templates         | CRUD  |
      | Alerts                  | CRUD  |
      | Announcements           | CRUDE |
      | Application             | R     |

  @OnHold
  Scenario: Validate default access for Role Playbook Administrator
    #continuing from edit role page
    When Navigate to page "/security/roles"
    And Filter grid column "Name" by entering "Playbook Administrator" in column level search box filter
    And Click row "1" of grid
    Then Verify access rights of modules
      | Connectors      | CRUE  |
      | Schedules       | CRUD  |
      | Playbooks       | CRUDE |
      | Approvals       | CRU   |
      | Email Templates | CRU   |
      | Security        | R     |
      | Application     | R     |

  @OnHold
  Scenario: Validate default access for Role Security Administrator
    #continuing from edit role page
    When Navigate to page "/security/roles"
    And Filter grid column "Name" by entering "Security Administrator" in column level search box filter
    And Click row "1" of grid
    Then Verify access rights of modules
      | Agents                  | CRUD |
      | Tenants                 | CRUD |
      | Security                | CRUD |
      | Application             | R    |
      | Secure Message Exchange | CRUD |


  @OnHold
  Scenario: Validate default access for Role T1 Analyst
    #continuing from edit role page
    When Navigate to page "/security/roles"
    And Filter grid column "Name" by entering "T1 Analyst" in column level search box filter
    And Click row "1" of grid
    Then Verify access rights of modules
      | Saved Reports | R     |
      | Comment       | CRU   |
      | Schedules     | CRU   |
      | Tasks         | CRU   |
      | Playbooks     | E     |
      | People        | R     |
      | Dashboard     | CRU   |
      | Reporting     | R     |
      | War Rooms     | CRUDE |
      | Attachments   | CRU   |
      | Connectors    | E     |
      | Widgets       | E     |
      | Alerts        | CRU   |
      | Announcements | CRU   |
      | Files         | CRU   |
      | Application   | R     |
      | Indicators    | CRU   |


  @OnHold
  Scenario: Validate default access for Role T2 Analyst
    #continuing from edit role page
    When Navigate to page "/security/roles"
    And Filter grid column "Name" by entering "T2 Analyst" in column level search box filter
    And Click row "1" of grid
    Then Verify access rights of modules
      | Saved Reports | R     |
      | Comment       | CRU   |
      | Schedules     | CRU   |
      | Tasks         | CRU   |
      | Playbooks     | E     |
      | People        | R     |
      | Dashboard     | CRU   |
      | Incidents     | CRU   |
      | Reporting     | R     |
      | War Rooms     | CRUDE |
      | Attachments   | CRU   |
      | Connectors    | E     |
      | Widgets       | E     |
      | Alerts        | CRU   |
      | Announcements | CRU   |
      | Files         | CRU   |
      | Application   | R     |
      | Indicators    | CRU   |

  @OnHold
  Scenario: Validate UI Access for Application Administrator
    # modify role
    When Navigate to page "/security/roles"
    And Filter grid column "Name" by entering "UI Automation Analyst" in column level search box filter
    And Click row "1" of grid
    And Set permissions for modules
      | Alerts | CRUD |
    And Click "Save" button
    # modify user
    When Navigate to page "/security/people"
    And Filter grid column "First Name" by entering "Rahul" in column level search box filter
    And Click row "1" of grid
    And Select user role
      | Application Administrator |
      | UI Automation Analyst     |
    And Click "Save" button
    And Admin User Logout
    Then Login to FortiSOAR
      | Username | Password  |
      | rahul    | Demo@1234 |
    # Validate left nav panel links
    Then Validate options available in left navigation panel
    #first row navigation group, other row pages in group
      | Resources       | Help | Incident Response |
      | Email Templates |      | Alerts            |
    When Click Setting Button
    And Validate user is able to access below pages From settings
    #first column navigation group, other column pages in group
      | System               | Application Editor    |
      | System Configuration | Modules               |
      | License Manager      | Picklists             |
      |                      | Navigation            |
      |                      | Correlation Settings  |
      |                      | Recommendation Engine |

  @OnHold
  Scenario: Validate App Admin User is able to modify SVT for Form View
    When Navigate to page "/modules/alerts"
    And Alert Grid is displayed
    And Click "Add" button
    Then Alert creation form is displayed
    And Click "Edit Template" button
    And Click Edit Widget for "Form Group: Summary"
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Popup Header | Form Group     | h3  |
    When Add "Escalated" field in the Select a field Dropdown
    And Click "Add" button
    And Remove "Description" from selected field list
    And Click "Save" button
    When Click "Add Row" button
    And Click "Add Widget" button number "2"
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Popup Header | Choose Widget  | h3  |
    When Click the widget "Form Group"
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Popup Header | Form Group     | h3  |
    When Enter "Auto Group" in field "Form Group Title"
    And Add "Source Type" field in the Select a field Dropdown
    And Click "Add" button
    And Click "Save" button
    And Click "Apply Changes" button
    Then Verify Visible text
      | Text Type    | Text to Search | Tag  |
      | Popup Header | Confirm        | span |
    When Click "Confirm" button
    Then Verify added fields are present in edit Form SVT
      | Summary    | Escalated   |
      | Auto Group | Source Type |
    And Verify removed fields are not present in edit Form SVT
      | Summary | Description |

  @OnHold
  Scenario: Validate App Admin User is able to modify SVT for Detail View
    When Enter "Test Alert SVT Validation" in field "Name"
    And Wait for specified time
      | 3 |
    And Set dropdown field "Escalated" to "Yes"
    And Wait for specified time
      | 3 |
    And Enter "Test Source Type" in field "Source Type"
    And Wait for specified time
      | 2 |
    And Click "Save" button
    Then Verify record "Test Alert SVT Validation" opens
    When Click "Edit Template" button
    Then Verify Visible text
      | Text Type         | Text to Search                | Tag |
      | Roles Page header | Template Editing Mode Enabled | h6  |
    And Click "New Tab" button
    And Enter tab title as "Auto Tab Title"
    And Enter tab sub title as "Auto Tab Sub Title"
    And Click submit button for the added tab
    And Add star Icon to the tab "Auto Tab Title"
    And Click "Add Widget" button under newly added tab
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Popup Header | Choose Widget  | h3  |
    When Click the widget "Editable Form Group"
    Then Verify "Editable Form Group" is present under selected tab
    And Click Edit Widget for "Editable Form Group" under newly added tab
    Then Verify Visible text
      | Text Type    | Text to Search      | Tag |
      | Popup Header | Editable Form Group | h3  |
    When Enter "Auto Group" in field "Form Group Title"
    And Add "Source Type" field in the Select a field Dropdown
    And Click "Add" button
    And Click "Save" button
    And Click "Apply Changes" button
    Then Verify Visible text
      | Text Type    | Text to Search | Tag  |
      | Popup Header | Confirm        | span |
    When Click "Confirm" button
    Then Verify record "Test Alert SVT Validation" opens
    When Click tab "Auto Tab Title"
    Then Verify value of "Source Type" on Record Detail as "Test Source Type"
    Then Close Record Detail View

  @OnHold
  Scenario: Validate App Admin User is able to modify SVT for List View
    Given Navigate to page "modules/alerts"
    When Click "Edit Template" button
    Then Verify Visible text
      | Text Type         | Text to Search                | Tag |
      | Roles Page header | Template Editing Mode Enabled | h6  |
    When Remove widget "Chart: Open Alerts By Severity"
    And Click Edit Widget for "Grid"
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Popup Header | Grid           | h3  |
    And Wait for specified time
      | 1 |
    #grid widget field have duplicate locators which are not displayed but present, hence new steps are implemnted
    When Remove "Escalated" from selected field list on grid widget
    And Select column "Domain" in grid widget
    And Click "Add Column" button on grid widget
    And Click "Save" button
    And Click "Apply Changes" button
    Then Verify Visible text
      | Text Type    | Text to Search | Tag  |
      | Popup Header | Confirm        | span |
    When Click "Confirm" button
    Then Alert Grid is displayed
    And Verify invisibility of text
      | Text Type           | Text to Search          | Tag |
      | Chart Widget Header | Open Alerts By Severity | h5  |

    And Verify "unavailable" columns in grid
      | Escalated |
    And Verify "available" columns in grid
      | Domain |
    When Click Hamburger Menu
    #Deslect/Select column from hamburger menu
    And Click "ID" button
    And Click "Source Type" button
    Then Verify "unavailable" columns in grid
      | ID |
    And Verify "available" columns in grid
      | Source Type |
    When Click "Reset columns to default" button
    And Wait for specified time
      | 1 |
    Then Verify "unavailable" columns in grid
      | Source Type |
    And Verify "available" columns in grid
      | ID |

  @OnHold
  Scenario: Validate UI Access for T1 Analyst
   #in continuation with app admin who is logged in previous scenario ,
     # hence forcing previous user to log out first
    When Navigate to page "logout"
    Given Login to FortiSOAR
      | Username | Password  |
      | csadmin  | Demo@1234 |
    # modify user
    When Navigate to page "/security/people"
    And Filter grid column "First Name" by entering "Rahul" in column level search box filter
    And Click row "1" of grid
    And Select user role
      | T1 Analyst |
    And Click "Save" button
    And Admin User Logout
    Then Login to FortiSOAR
      | Username | Password  |
      | rahul    | Demo@1234 |
    # Validate left nav panel links
    Then Validate options available in left navigation panel
    #first row navigation group, other row pages in group
      | Dashboard | Incident Response | Automation | Resources       | Reports | Help |
      |           | Alerts            | Schedules  | Attachments     |         |      |
      |           | Tasks             |            | Email Templates |         |      |
      |           | Indicators        |            |                 |         |      |
      |           | War Rooms         |            |                 |         |      |
    When Click dashboard dropdown
    Then Validate Dashboards available for "T1 Analyst"
      | System Dashboard | T1 Analyst |
    And Validate availability status of header navigation option
      | Notification  | available   |
      | User Links    | available   |
      | Playbook Logs | unavailable |
      | Settings      | unavailable |
      | Pending Task  | available   |
    When Navigate to page "/modules/incidents"
    Then Verify Visible text
      | Text Type        | Text to Search      | Tag |
      | Page Access Text | Unauthorized Access | h1  |

  @OnHold
  Scenario: T1 Analyst is able to perform alert Triage
      #Create Alert
    Given Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click on Add Alert
    Then Alert creation form is displayed
    When Enter "Test Alert Triage Validation" in field "Name"
    And Wait for specified time
      | 1 |
    And Click "Save" button
    Then Verify record "Test Alert Triage Validation" opens
    #Update Alert
    When Click severity on alerts details view
    And Select Severity as "High"
    And Click tab "Alert Details"
    And Scroll to text "Indicators"
    When Click tab "Indicators"
    And Click "Add Indicator" button
    Then Verify Visible text
      | Text Type               | Text to Search    | Tag |
      | Indicator Pop Up Header | Add New Indicator | h3  |
    When Set indicator type to "IP Address"
    And Enter "1.1.1.1" in field "Value"
    And Wait for specified time
      | 2 |
    And Click "Create" button
    And Wait for specified time
      | 2 |
    And Filter grid column "Value" by entering "1.1.1.1" in column level search box filter
    And Verify record with column "Value" as "1.1.1.1" is present in row "1"
    When Select "indicator" record at row "1"
    And Set Reputation to "Malicious"
    #add comment
    When Click on Collaboration panel
    Then Verify Visible text
      | Text Type                        | Text to Search | Tag |
      | Collaboration Panel Comments Tab | Comments       | a   |
    When Click "Comments" link
    Then Verify Visible text
      | Text Type | Text to Search | Tag    |
      | Button    | New Comment    | button |
    When Click on Add new comment
    When Add comment "UI Auto: Alert Triage"
    And Wait for specified time
      | 1 |
    When Click Send Comment
    Then Verify comment "UI Auto: Alert Triage" is published
    And Close Record Detail View
    And Filter grid column "Name" by entering "Test Alert Triage Validation" in column level search box filter
    When Select "alert" record at row "1"
    And Click Escalate button
    Then Verify Visible text
      | Text Type         | Text to Search | Tag |
      | Escalation Pop Up | Escalate       | h3  |
    When Enter "Test Alert Triage: Escalation" in field "Incident Name"
    And Select incident lead as "Rahul"
    And Wait for specified time
      | 2 |
    And Select incident type as "Data Theft"
    When Click Incident Escalate button
    Then Verify toaster message appears
      | Alert > Escalate To Incident |
    And Wait for specified time
      | 3 |
    And Verify record with column "Escalated" as "Yes" is present in row "1"
    When Custom User Logout
    And Login to FortiSOAR
      | Username | Password  |
      | csadmin  | Demo@1234 |
    And Navigate to page "modules/alerts"
    And Filter grid column "Name" by entering "Test Alert Triage Validation" in column level search box filter
    And Click row "1" of grid
    And Click tab "Correlations"
    And Select "incidents" from relationship tab
    And Filter grid column "Name" by entering "Test Alert Triage: Escalation" in column level search box filter
    And Verify record with column "Name" as "Test Alert Triage: Escalation" is present in row "1"

  @OnHold
  Scenario: Validate UI Access for T2 Analyst
   #in continuation with t1 Analyst who is logged in previous scenario ,
     # hence forcing previous user to log out first
    When Navigate to page "logout"
    Given Login to FortiSOAR
      | Username | Password  |
      | csadmin  | Demo@1234 |
    # modify user
    When Navigate to page "/security/people"
    And Filter grid column "First Name" by entering "Rahul" in column level search box filter
    And Click row "1" of grid
    And Select user role
      | T2 Analyst |
    And Click "Save" button
    And Admin User Logout
    Then Login to FortiSOAR
      | Username | Password  |
      | rahul    | Demo@1234 |
    # Validate left nav panel links
    Then Validate options available in left navigation panel
    #first row navigation group, other row pages in group
      | Dashboard | Incident Response | Automation | Resources       | Reports | Help |
      |           | Alerts            | Schedules  | Attachments     |         |      |
      |           | Incidents         |            | Email Templates |         |      |
      |           | Tasks             |            |                 |         |      |
      |           | Indicators        |            |                 |         |      |
      |           | War Rooms         |            |                 |         |      |
    When Click dashboard dropdown
    Then Validate Dashboards available for "T2 Analyst"
      | System Dashboard | T2 Analyst |
    And Validate availability status of header navigation option
      | Notification  | available   |
      | User Links    | available   |
      | Playbook Logs | unavailable |
      | Settings      | unavailable |
      | Pending Task  | available   |
    When Navigate to page "playbooks/collections/"
    Then Verify Visible text
      | Text Type        | Text to Search      | Tag |
      | Page Access Text | Unauthorized Access | h1  |




@Regression
Feature: Widgets


  Scenario: Verify Create Widget for inline placement
    When Navigate to page "/content-hub/workspace/?contentType=widget"
    Then Verify filter tag "Widgets" is visible
    When Click "Create" button
    Then Select New Widget
    Then Verify Visible text
      | Text Type  | Text to Search    | Tag |
      | Page title | Create New Widget | h3  |
    When Click Let's start by defining a widget button
    Then Enter Widget details
    Then Click "Create Widget" button
    Then Verify toaster message appears
      | Widget created successfully. |
    When Click "Publish Widget" button
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Publish Widget | span |
    Then Click "Publish" button
    Then Verify toaster message appears
      | Widget - "AutoWidget," published successfully. Application will reload to take effect. |
    When Wait for specified time
      | 5 |
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Content Hub    | span |
    When Navigate to page "Dashboard"
    When Click Dashboard Setting Button
    Then Verify Dashboard Menu is displayed
    When Click New Dashboard option
    Then Verify Create Dashboard page is displayed
    When Enter dashboard template title for widget
    When Click Add Row Button
    Then Verify Add Widget button is enabled
    When Click Add Widget button
    Then Verify Choose Widget popup is displayed
    When Select AutoWidget
    Then Verify Visible text
      | Text Type  | Text to Search        | Tag |
      | Page title | Hello World Edit View | h3  |
    Then Click "Save" button
    Then Verify "AutoWidget" added to Dashboard
    When Click Apply Changes button
    Then Verify toaster message appears
      | Template Saved |
    Then Verify Visible text
      | Text Type  | Text to Search      | Tag  |
      | Page title | Hello World Title   | h5   |
      | Page title | Hello World Content | span |


  Scenario: Verify Edit Widget  # SSH Support is needed for this case Query:Fireflink supports SSH Action
    Given Verify execution of below scenarios is successful
      | Verify Create Widget for inline placement |
    When Navigate to page "/content-hub/my-content/?contentType=widget"
    Then Verify filter tag "Widgets" is visible
    When Search content hub item "AutoWidget"
    Then Verify visibility of content hub item
      | widget | AutoWidget |
    When Click "widget" tile "AutoWidget"
    Then Verify "AutoWidget" configuration page opens
    When Wait for specified time
      | 3 |
    When Click "Edit" button
    When Wait for specified time
      | 3 |
    Then Verify Visible text
      | Text Type  | Text to Search                                      | Tag  |
      | Page title | Do you want to edit this widget or add new version? | span |
    When Click pop-up window Edit button
    Then Verify Visible text
      | Text Type  | Text to Search | Tag |
      | Page title | EXPLORER       | div |
    When Update widget details
    When Click "Save Changes" button
    Then Verify toaster message appears
      | File saved successfully. |
    Then Click "Publish Widget" button
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Publish Widget | span |
    Then Click "Publish" button
    Then Verify toaster message appears
      | Widget - "AutoWidgetUpdated," published successfully. Application will reload to take effect. |
    When Wait for specified time
      | 5 |
    Then Verify "AutoWidgetUpdated" configuration page opens
    When Navigate to page "Dashboard"
    When Select the dashboard
      | Widget_Dashboard |
    Then Verify Visible text
      | Text Type  | Text to Search      | Tag  |
      | Page title | UIAutoTitle  | h5   |
      | Page title | Hello World Content | span |
    When Click Dashboard Setting Button
    Then Verify Edit Dashboard option is visible
    When Click Edit Dashboard
    Then Verify Edit Dashboard page is displayed
    Then Verify "AutoWidgetUpdated" added to Dashboard
    When Open widget edit page
    Then Verify Visible text
      | Text Type  | Text to Search      | Tag  |
      | Page title | UIAutoEditView      | h3   |


  Scenario: Verify Create Button Launch Widget
    Given Reload the webpage
    When Navigate to page "/content-hub/workspace/?contentType=widget"
    Then Verify filter tag "Widgets" is visible
    When Click "Create" button
    Then Select New Widget
    Then Verify Visible text
      | Text Type  | Text to Search    | Tag |
      | Page title | Create New Widget | h3  |
    When Click Let's start by defining a widget button
    Then Enter button widget details
    Then Click "Create Widget" button
    Then Verify toaster message appears
      | Widget created successfully. |
    When Click "Publish Widget" button
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Publish Widget | span |
    Then Click "Publish" button
    Then Verify toaster message appears
      | Widget - "ButtonWidget," published successfully. Application will reload to take effect. |
    When Wait for specified time
      | 5 |
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Page title | Content Hub    | span |
    When Navigate to page "/content-hub/workspace/"
    Then Verify "Create" tab is active
    When Click button "Create"
    Then Verify visible text
      | Text Type | Text to Search    | Tag  |
      | Text Type | New Solution Pack | span |
    Then Click NewSolutionPack dropdown value
    Then Verify "Start" tab is highlighted
    Then Verify "About Solution Pack" tab is not highlighted
    Then Click button "Let's start by defining a solution pack"
    Then Enter "Launch Wizard SP UI Auto" in field "Solution Pack Name"
    Then Enter "2.0.0" in field "Version"
    Then Verify visible text
      | Text Type           | Text to Search | Tag   |
      | Configuration label | Publisher      | label |
    And Enter "UI Auto" in field "Publisher"
    Then Verify visible text
      | Text Type           | Text to Search | Tag   |
      | Configuration label | Compatibility  | label |
    And Enter "7.4.0" in field "Compatibility"
    Then Verify visible text
      | Text Type           | Text to Search | Tag   |
      | Configuration label | Description    | label |
    And Enter "Created Custom SP by UI Automation script" in TextArea "Description"
    Then Verify visible text
      | Text Type           | Text to Search | Tag   |
      | Configuration label | Support Info   | label |
    And Enter "FortiSOAR QA Team" in TextField Support Info
    Then Verify visible text
      | Text Type           | Text to Search | Tag   |
      | Configuration label | Category       | label |
    And Add "Asset Management" value in dropdown Category on solution pack wizard
    When Click "Category" label
    When Add record details
      | Tags            |
      | CustomSP_UIAuto |
    When Click "Tags" label
    When Click "Configure post-install action" label
    Then Select option "ButtonWidget (1.0.0)" in the dropdown "Widget_selectWidgetDropdown" on "Select a widget"
    Then Enter "Launch Button" in field "Button Label"
    Then Click "Launch automatically the first time" label
    When Click Continue button on About Solution Pack tab
    Then Verify "Prerequisites" tab is highlighted
    Then Verify "Choose Entities" tab is not highlighted
    Then Verify visible text
      | Text Type            | Text to Search                 | Tag |
      | Configuration header | Add Solution Pack Dependencies | div |
    When Click Continue button on Prerequisites tab
    Then Verify "Choose Entities" tab is highlighted
    Then Verify "Filter Data" tab is not highlighted
    Then Verify visible text
      | Text Type            | Text to Search        | Tag |
      | Configuration header | Select Configurations | p   |
    Then Verify select all checkbox is not selected
    Then Click "Dashboards" label
    When Click continue button on Choose Entities tab of solution pack edit wizard
    Then Verify "Filter Data" tab is highlighted
    Then Verify "Create Solution Pack" tab is not highlighted
    Then Verify Include Everything checkbox is not selected
    Then Verify visible text
      | Text Type   | Text to Search                        | Tag |
      | Page header | Choose Dashboards to Export | h4  |
    Then Click "Widget_Dashboard" label
    When Verify entity count is correct on solution pack wizard
      | Entity              | Count |
      | Dashboards          | 1     |
    When Click "Button" "Button_Continue_Filter_Data_EditSolutionPack" on "Filter Data tab" using locator type "id"
    Then Verify "Create Solution Pack" tab is highlighted
    Then Verify visible text
      | Text Type   | Text to Search       | Tag |
      | Page header | Review Solution pack | h3  |
    Then Verify visible text
      | Text Type | Text to Search                                         | Tag  |
      | Text      | 1 Dashboard(s)                                         | div  |
      | Text      | Launch Wizard SP UI Auto                               | span |
      | Text      | Version: 2.0.0                                         | div  |
      | Text      | Description: Created Custom SP by UI Automation script | div  |
    When Click button "Save and Publish"
    Then Verify toaster message appears
      | Solution Pack created and published successfully. |
    Then Verify visible text
      | Text Type   | Text to Search                                      | Tag |
      | Page header | Solution Pack Successfully Published Locally! | div |
    When Navigate to page "/content-hub/my-content/?contentType=solutionpack"
    Then Verify filter tag "Solution Packs" is visible
    When Search content hub item "Launch Wizard SP UI Auto"
    Then Verify visibility of content hub item
      | Solution Pack | Launch Wizard SP UI Auto |
    When Click "Solution Pack" tile "Launch Wizard SP UI Auto"
    Then Verify "Launch Wizard SP UI Auto" configuration page opens
    Then Verify Visible text
      | Text Type   | Text to Search       | Tag |
      | Page header | Hello World Title    | h5  |
      | Page header | Hello World Content  | span|
    When Press ESCAPE key from keypad
    When Click button "Launch Button"
    Then Verify Visible text
      | Text Type   | Text to Search       | Tag |
      | Page header | Hello World Title    | h5  |
      | Page header | Hello World Content  | span  |

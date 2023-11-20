@Regression
Feature: Recommendation Engine


  Scenario: Verify Elasticsearch Based Text Classification recommendation is selected by default
    When Navigate to page "/editor/recommendationengine"
    Then Verify Visible text`
      | Text Type               | Text to Search                          | Tag    |
      | Page title              | Recommendation Engine                   | h1     |
      | Status                  | Enabled                                 | button |
      | Strategies              | Recommendation Strategy                 | div    |
      | recommendation strategy | Elasticsearch Based Text Classification | label  |
      | recommendation strategy | Machine Learning Based Clustering       | label  |
    Then Verify "Elasticsearch Based Text Classification" is selected


  Scenario: Verify Suggestion's are displayed for Default Recommendations Settings
    Given Verify execution of below scenarios is successful
      | Verify Elasticsearch Based Text Classification recommendation is selected by default |
    Given Navigate to page "/content-hub/all-content/"
    When Search content hub item "Stolen Credential Leading to Data Exfiltration"
    Then Verify visibility of content hub item
      | Solution Pack | Stolen Credential Leading to Data Exfiltration |
    When Click "Solution Pack" tile "Stolen Credential Leading to Data Exfiltration"
    When Click "Install" button
    Then Verify Visible text
      | Text Type    | Text to Search                     | Tag  |
      | Popup header | Confirm Solution Pack Installation | span |
    When Click "Confirm" button
    Then Verify Visible text
      | Text Type    | Text to Search                                                         | Tag |
      | Popup header | Install Solution Pack - Stolen Credential Leading to Data Exfiltration | h3  |
    Then Wait for solution pack installation to complete
      | Polling Timeout (In Seconds) |
      | 180                          |
    And Verify solution pack dependencies are installed
      | SOAR Framework |
      | SOC Simulator  |
    Then Navigate to page "/modules/alerts"
    And Wait for specified time
      | 2 |
    Then Verify Visible text
      | Text Type | Text to Search    | Tag    |
      | Button    | Simulate Scenario | button |
    When Click "Simulate Scenario" button
    Then Verify Visible text
      | Text Type    | Text to Search    | Tag |
      | Popup header | Simulate Scenario | h3  |
    When Click scenario dropdown
    Then Select scenario "Stolen Credential Leading to Data Exfiltration"
    And Wait for specified time
      | 1 |
    And Click "Start Scenario" button
    Then Verify toaster message appears
      | Triggered action "Run Selected Scenario". |
    And Wait for specified time
      | 25 |
    When Filter grid column "Name" by entering "CUSTOM Windows Scheduled Task Created" in column level search box filter
    Then Verify grid row "CUSTOM Windows Scheduled Task Created" is present
    When Click grid cell with text "CUSTOM Windows Scheduled Task Created"
    Then Verify Visible text
      | Text Type    | Text to Search                        | Tag |
      | Record Title | CUSTOM Windows Scheduled Task Created | p   |
    Then Click on Collaboration panel
    #Then Click on Recommendations tab
    And Click tab "Recommendations"
    And Wait for specified time
      | 2 |
    Then Verify Visible text
      | Text Type | Text to Search | Tag |
      | Title     | Suggestions    | div |
    And Wait for specified time
      | 2 |
    And Verify Fields in suggestions table
      | Severity |


  Scenario: Verify Similar Record's are displayed for Default Recommendations Settings
    Given Verify execution of below scenarios is successful
      | Verify Suggestion's are displayed for Default Recommendations Settings |
    Given Verify record "CUSTOM Windows Scheduled Task Created" opens
    And Click tab "Records"
    Then Verify Similar Records listed


  Scenario: Verify Similar Record's are linked to same Indicator
    Given Verify execution of below scenarios is successful
      | Verify Similar Record's are displayed for Default Recommendations Settings |
    Given Verify record "CUSTOM Windows Scheduled Task Created" opens
    Given Click tab "Indicators"
    Given Verify "Indicators" tab is highlighted
    When Filter grid column "Value" by entering "10.0.1.11" in column level search box filter
    Then Verify grid record count is "1"
    Then Scroll to text "First Seen"
    When Click row "1" of grid
    Then Verify Indicator record "10.0.1.11" opens
    When Scroll to text "Sightings"
    When Click Alerts Tab
    Then Verify Similar Records are linked



  Scenario: Disable "Show Similar Records Suggestions" and verify Similar Records Suggestions are not visible
    Given Verify execution of below scenarios is successful
      | Verify Similar Record's are linked to same Indicator |
    Given Verify Indicator record "10.0.1.11" opens
    When Click "Alert: CUSTOM Windows Scheduled Task Created" link
    And Wait for specified time
      | 2 |
    When Click on Collaboration panel
    When Click on Recommendations tab
    Then Verify "Recommendations" tab is highlighted
    When Click Recommendations Setting button
    When Click tab "Records"
    Then Verify Visible text
      | Text Type  | Text to Search          | Tag |
      | Page Title | Recommendation Settings | h6  |
      | Title      | Records                 | a   |
    And Wait for specified time
      | 1 |
    When Click tab "Records"
    Then Verify "Show Similar Record Suggestions" toggle is enabled
    When Click "Show Similar Record Suggestions" toggle
    When Click "Save" button
    Then Verify "Recommendations" tab is highlighted
    Then Verify Visible text
      | Text Type | Text to Search                           | Tag |
      | Title     | No predictions available for this record | div |
    When Click Recommendations Setting button
    When Click tab "Records"
    And Wait for specified time
      | 2 |
    And Click tab "Records"
    When Click "Show Similar Record Suggestions" toggle
    And Wait for specified time
      | 2 |
    When Click "Save" button
    Then Verify "Recommendations" tab is highlighted
    Then Verify Visible text
      | Text Type | Text to Search | Tag |
      | Title     | Suggestions    | div |



  Scenario: Verify Predicted Suggestions values get applied to Record  #done
    Given Verify execution of below scenarios is successful
      | Disable "Show Similar Records Suggestions" and verify Similar Records Suggestions are not visible |
    Given Verify record "CUSTOM Windows Scheduled Task Created" opens
    Given Verify Fields in suggestions table
      | Severity |
    When Click "Severity" Suggestions
    And Wait for specified time
      | 2 |
    Then Verify toaster message appears
      | Severity updated successfully! |
    Then Verify alert severity is "Medium"



  Scenario: Import alert data for Recommendations and phishing testing
    Given Verify execution of below scenarios is successful
      | Disable "Show Similar Records Suggestions" and verify Similar Records Suggestions are not visible |
    Given Verify record "CUSTOM Windows Scheduled Task Created" opens
    When Click Close Alert details page
    When Navigate to page "/editor/importer"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page header | Import Wizard  | h1  |
    When Click "Import From File" button
    Then Verify "Configurations" tab is not highlighted
    When Select file
      | FileName                                | FilePath |
      | Auto_Recommendations_Alerts_Records.zip |          |
    Then Verify Configurations list is visible
    Then Verify "Configurations" tab is highlighted
    When Click "Continue" button
    Then Verify grid entry
      | Alerts |
    When Click Continue button on Options tab
    Then Verify "Run Import" tab is highlighted
    When Click "Run Import" button
    Then Wait for Import to complete
      | Total Time | Polling Time |
      | 240        | 5            |
    When Click "Done" button
    Then Verify Import grid record
      | File                                    | Status          |
      | Auto_Recommendations_Alerts_Records.zip | Import Complete |
    When Navigate to page "/modules/alerts"
    When Set grid dropdown filter "Type" to "Suspicious Email"
    Then Verify total items displayed



  Scenario: Configure Machine learning based clustering with KNN algorithm
    Given Verify execution of below scenarios is successful
      | Import alert data for Recommendations and phishing testing |
    When Navigate to page "/editor/recommendationengine"
    When Click radio Button "Machine Learning Based Clustering"
    Then Verify Visible text
      | Text Type   | Text to Search      | Tag   |
      | Field Label | Configuration Name  | label |
      | Field Label | Module to train for | label |
      | Field Label | Feature Set         | label |
      | Field Label | Verdict             | label |
      | Field Label | Date Range          | label |
      | Field Label | Training Set Size   | label |
      | Field Label | Algorithm           | label |
      | Field Label | Listener Port       | label |
    And Scroll to text "Configuration Name"
    And Click "Configuration Name" label
    When Enter connector Configuration Name "Auto_ML_Engine_Configuration"
    And  Select Configuration as a Default Configuration
    When Select "fsr_module" dropdown value "Alerts"
    And Unselect all from dropdown field "Feature Set"
    And Set select dropdown field "Feature Set" to "Source"
    And Set select dropdown field "Feature Set" to "Type"
    And Unselect all from dropdown field "Verdict"
    And Set select dropdown field "Verdict" to "Assigned To"
    And Set select dropdown field "Verdict" to "Severity"
    When Select "date_range" dropdown value "Last year"
    When Enter "1000" in field "Training Set Size"
    When Verify Visible text
      | Text Type | Text to Search      | Tag    |
      | Algorithm | K-Nearest Neighbors | option |
    When Enter "10443" in field "Listener Port"
    Then Verify "Save & Train Model" button is enabled
    Then Click "Save & Train Model" button
    And Wait for specified time
      | 15 |
    Then Verify toaster message appears
      | Connector configuration saved successfully. |



  Scenario: Verify Suggestions and Similar Records are visible for KNN algorithm
    Given Verify execution of below scenarios is successful
      | Configure Machine learning based clustering with KNN algorithm |
    Given Navigate to page "/modules/alerts"
    When Filter grid column "Name" by entering "Undeliverable: Thank you for your submission" in column level search box filter
    Then Verify grid row " Undeliverable: Thank you for your submission " is present
    Then Click row "1" of grid
    Then Verify Visible text
      | Text Type    | Text to Search                               | Tag |
      | Record Title | Undeliverable: Thank you for your submission | p   |
    Then Verify Visible text
      | Text Type | Text to Search | Tag |
      | Title     | Suggestions    | div |
    And Wait for specified time
      | 2 |
    And Verify Fields in suggestions table
      | Severity |
    And Click tab "Records"
    Then Verify Visible text
      | Text Type | Text to Search  | Tag |
      | Title     | Similar Records | div |
    Then Verify Similar Records listed



  Scenario: Configure Machine learning based clustering with DT algorithm
    Given Verify execution of below scenarios is successful
      | Import alert data for Recommendations and phishing testing |
    When Navigate to page "/editor/recommendationengine"
    Then Verify "Record Similarity" tab is highlighted
    Then Verify Visible text
      | Text Type   | Text to Search | Tag   |
      | Field Label | Algorithm      | label |
    When Select "algo" dropdown value "Decision Tree"
    Then Verify "Save & Train Model" button is enabled
    Then Click "Save & Train Model" button
    Then Verify toaster message appears
      | Connector configuration saved successfully. |


  Scenario: Verify Suggestions are visible for DT algorithm
    Given Verify execution of below scenarios is successful
      | Configure Machine learning based clustering with DT algorithm |
    Given Navigate to page "/modules/alerts"
    When Filter grid column "Name" by entering "Undeliverable: Thank you for your submission" in column level search box filter
    Then Click row "1" of grid
    Then Verify "Recommendations" tab is highlighted
    Then Verify Visible text
      | Text Type | Text to Search | Tag |
      | Title     | Suggestions    | div |
    And Wait for specified time
      | 2 |
    And Verify Fields in suggestions table
      | Severity |


  Scenario: Verify Similar Records are not visible for DT algorithm
    Given Verify execution of below scenarios is successful
      | Verify Suggestions are visible for DT algorithm |
    Given Verify record "Undeliverable: Thank you for your submission" opens
    When Click tab "Records"
    Then Verify Visible text
      | Text Type | Text to Search  | Tag |
      | Title     | Similar Records | div |
    Then Verify Visible text
      | Text Type | Text to Search                                                                               | Tag |
      | Text      | Recommendations cannot load. Please verify the Recommendation Engine Settings and try again. | div |
    When Click "Show more" link
    Then Verify Visible text
      | Text Type | Text to Search                                                                                                         | Tag  |
      | Text      | An exception occurred: Similar records with Decision Tree algorithm is not supported  Connector :: fortisoar-ml-engine | span |


  Scenario: Configure Phishing Classifier with Pre-Trained Data
    Given Verify execution of below scenarios is successful
      | Import alert data for Recommendations and phishing testing |
    Given Navigate to page "/editor/recommendationengine"
    Then Verify Visible text
      | Text Type  | Text to Search        | Tag |
      | Page title | Recommendation Engine | h1  |
    When Click tab "Phishing Classification"
    Then Verify Phishing Classifier connector is selected as Default
    When Enter connector Configuration "Auto_Phishing_classifier_Config"
    And  Select Configuration as a Default Configuration
    Then Set select type dropdown field "Type of Training Data" to "Pre-Trained"
    Then Verify Visible text
      | Text Type | Text to Search                 | Tag  |
      | Label     | Display predictions for module | span |
      | Label     | Email From                     | div  |
      | Label     | Email Subject                  | div  |
      | Label     | Email Body                     | div  |
    When Set select dropdown field "Email From" to "Email From"
    When Set select dropdown field "Email Subject" to "Email Subject"
    When Set select dropdown field "Email Body" to "Email Body"
    When Click on Save Configuration button
    Then Verify toaster message appears
      | Connector configuration saved successfully. |
    And Verify toaster message appears
      | Health check will run after a grace period of 60 seconds. |

    Then Click Connector Health check refresh button
    When Verify Health Check is available



      Scenario: Verify Phishing Suggestions are visible for Pre-Trained Data
      Given Verify execution of below scenarios is successful
      |Import alert data for Recommendations and phishing testing |
      |Configure Phishing Classifier with Pre-Trained Data        |
      Given Navigate to page "/modules/alerts"
      When Filter grid column "Name" by entering "Major update from Message center" in column level search box filter
      Then Click row "1" of grid
      Then Verify "Recommendations" tab is highlighted
      Then Verify Visible text
        | Text Type | Text to Search| Tag  |
        | Title     | Suggestions   | div  |
      And Wait for specified time
        | 2 |
      Then Verify Visible text
        | Text Type  | Text to Search | Tag  |
        | Suggestions | is this Phishing?  | div |
        | Confidence |  99% Confidence |   span  |


  Scenario: Configure Phishing Classifier with FortiSOAR Module
    Given Verify execution of below scenarios is successful
      |Import alert data for Recommendations and phishing testing |
    Given Navigate to page "/editor/recommendationengine"
    Then Click tab "Phishing Classification"
    Then Verify "Phishing Classification" tab is highlighted
    Then Select Configuration "+ Add new configuration"
    When Enter connector Configuration "Auto_Phishing_classifier_Config_on_FortiSOAR_Module"
    And  Select Configuration as a Default Configuration
    Then Set select type dropdown field "Type of Training Data" to "FortiSOAR Module"
    Then Verify Visible text
      | Text Type | Text to Search                 | Tag  |
      | Label     | Module to train for            | span |
      | Label     | Date Range                     | label  |
      | Label     | Training Set Size              | label  |
      | Label     | Email From                     | div  |
      | Label     | Email Subject                  | div  |
      | Label     | Email Body                     | div  |
      | Label     | Verdict Field Mapping          | label  |
      | Label     | Verdict                        | label  |
      | Label     | Phishing                       | div  |
      | Label     | Non Phishing                   | div  |
    When Select module to train for Alerts module
    When Select date_range dropdown value Last 2 years
    When Enter "1000" in field "Training Set Size"
    When Set select dropdown field "Email From" to "Email From"
    When Set select dropdown field "Email Subject" to "Email Subject"
    When Set select dropdown field "Email Body" to "Email Body"
    When Select Phishing Verdict as Phishing
    When Select Non Phishing Verdict as Non Phishing
    When Click on Save Configuration button
    Then Verify toaster message appears
      | Connector configuration saved successfully. |
    And Verify toaster message appears
      | Health check will run after a grace period of 60 seconds. |

    Then Click Connector Health check refresh button
    When Verify Health Check is available


  Scenario: Verify Phishing Suggestions are visible FortiSOAR Module Data
    Given Verify execution of below scenarios is successful
     |Import alert data for Recommendations and phishing testing |
     |Configure Phishing Classifier with FortiSOAR Module        |
    Given Navigate to page "/modules/alerts"
    When Filter grid column "Name" by entering "Major update from Message center" in column level search box filter
    Then Click row "1" of grid
    Then Verify "Recommendations" tab is highlighted
    Then Verify Visible text
      | Text Type | Text to Search| Tag  |
      | Title     | Suggestions   | div  |
    And Wait for specified time
      | 2 |
    Then Verify Visible text
      | Text Type  | Text to Search | Tag  |
      | Suggestions | is this Phishing?  | div |
      | Confidence  |   % Confidence   | span |
    And Print the Confidence % value

    Scenario: Enable Recommendations for Alerts module field Severity from MMD
      Given Verify execution of below scenarios is successful
        | Verify Elasticsearch Based Text Classification recommendation is selected by default |
      Given Navigate to page "/editor/Master/modules/"
      Then Verify Create New Module is selected
      When Select Alerts module
      Then Verify Alerts module selected
      When Click on Fields Editor
      And Enter "Severity" in filter field
      And Click on the field at row "1"
      Then Verify Visible text
        | Text Type  | Text to Search | Tag  |
        | Label | Enable for recommendation   | label |
      When Click Enable For Recommendation Checkbox
      Then Verify Save button is enabled
      Then Click on MMD Save Button
      And Wait for specified time
        | 4 |
      Then Verify Publish button is enabled
      When Click on Publish button
      Then Verify Publish page is displayed
      Then Verify Publish button is disabled

      @Open_Bug #0918272
      Scenario:  Verify Auto Populate checkbox is visible in Create Record playbook step And value is Auto populated for record created
       Given Verify execution of below scenarios is successful
         | Verify Elasticsearch Based Text Classification recommendation is selected by default |
         | Import alert data for Recommendations and phishing testing |
        Given Navigate to page "/editor/recommendationengine"
        When Unselect all from dropdown field "Feature Set"
        And Set select dropdown field "Feature Set" to "Indicators"
        And Unselect all from dropdown field "Verdict"
        And Set select dropdown field "Verdict" to "Severity"
        And Select "algo" dropdown value "K-Nearest Neighbors"
        Then Verify "Save & Train Model" button is enabled
        Then Click "Save & Train Model" button
        Then Verify toaster message appears
          | Connector configuration saved successfully. |
        Given Navigate to page "/playbooks/collections/"
        And Wait for specified time
          | 2 |
        When Import Playbook Collection "UI_Auto_Populate_Recommendation.json"
        Then Verify specific playbook collection name is present in list
          | UI_Auto_Populate_Recommendation|
        When Select specific playbook collection
          | UI_Auto_Populate_Recommendation |
        Then Click "Link" "PlaybookCollection_PlaybookName" on "Playbook Collection Page"
        Then Click Create Alert Step
        When Enter text "Severity" in "FieldSearch_PlaybookStep" on "Create Alert Form Page"
        Then Verify Visible text
          | Text Type  | Text to Search | Tag  |
          | Label      | Severity       | label |
        And Scroll element "Playbook_Checkbox_Autopopulate" to center of page using locator type "id"
        Then "Checkbox" "Playbook_Checkbox_Autopopulate" is visible on "Create Record Playbook Step Form Page" using locator type "id"
        Then Click "Checkbox" "Playbook_Checkbox_Autopopulate" on "Create Record Playbook Step Form Page" using locator type "id"
        When Click Step Save button
        Then Verify Click Save Playbook
        And Wait for specified time
          | 2 |
        Then Click "Button" "Playbook_Button_TriggerPlaybookFromDesigner" on "Triggered Playbook from Playbook Designer Page" using locator type "id"
        And Wait for specified time
          | 2 |
        Then Click "Trigger Playbook" button
        Then Verify Visible text
          | Text Type  | Text to Search | Tag  |
          | Label      | Executed Playbook Logs | span |
        Then Navigate to page "/modules/alerts"
        When Filter grid column "Name" by entering "UI_Auto_Recommendation_Record" in column level search box filter
        Then Click row "1" of grid
        Then Verify alert severity is "Medium"

    Scenario: Verify Default criteria and filters are added in Playbook Recommendation Settings
      Given Verify execution of below scenarios is successful
        | Import alert data for Recommendations and phishing testing |
      Given Navigate to page "/modules/alerts"
      When Filter grid column "Name" by entering "Undeliverable: Thank you for your submission" in column level search box filter
      Then Click row "1" of grid
      Then Verify "Recommendations" tab is highlighted
      When Click Recommendations Setting button
      When Click tab "Playbooks"
      Then Verify Visible text
        | Text Type  | Text to Search | Tag  |
        | Label      | Show Suggested Playbooks | p |
      Then "Button" "PBRecommendationEngine_SimilarCriteriaName_RecommSettings" is visible on "Similar Criteria Visible on Recommendation Settings"
      Then "Button" "PBRecommendationEngine_SimilarCriteriaType_RecommSettings" is visible on "Similar Criteria Visible on Recommendation Settings"
      Then Verify custom date filter
        | Field     | Operator     | DifferenceType  | Range|
        | Created On| On or Before | Days             | From now|

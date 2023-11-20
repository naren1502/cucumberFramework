@Regression
Feature: CustomModule

   @Sanity
  Scenario: Create New Custom Module
    When Click Setting Button
    Then Modules is displayed
    Then Verify Create New Module is selected
    When Click on Fields Editor
    When Click on Add Field Link
    When Add Card Number Field
    Then Verify Save button is enabled
    Then Verify Publish button is disabled
    When Click on Add Field Link
    When Add CVV Field
    Then Verify Save button is enabled
    When Click Summary tab
    When Add Module Details
    When Click on Fields Editor
    When Click on MMD Save Button
    Then Verify Save button is disabled
    Then Verify Publish button is enabled
    When Click on Add Field Link
    When Add Card Type Field
    Then Verify Save button is enabled
    Then Verify Publish button is enabled
    When Click on MMD Save Button
    Then Verify Save button is disabled
    Then Verify Publish button is enabled
    When Click on Add Field Link
    When Add Correlation Field
    Then Verify Save button is disabled
    Then Verify Publish button is enabled
    When Click on Publish button
    Then Verify Publish page is displayed
    Then Verify Publish button is disabled
    Then Verify Credit Card is present in Module List
  
  #Author - Sunil Nikam
   @Sanity
  Scenario: Assign Permissions on Credit Card
    Given Verify execution of below scenarios is successful
      | Create New Custom Module |
    Given Verify Roles option is visible
    When Click Roles
    Then Verify Roles Page is displayed
    When Click Role to edit
    Then Verify Edit Role page is displayed
    Then Verify Credit Cards Module is present
    When Select Credit Cards CRUD Permissions
    When Click Save button
    Then Verify toaster message appears
      | Role saved. Any changes to your permissions should be reflected now |
    Then Verify Save Role Permission button is disabled
    Then Verify CRUD Permissions are selected
  
  #Author - Mangesh Bhagwat, Sunil Nikam
   @Sanity
  Scenario: Add credit card module to navigation panel
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Verify execution of below scenarios is successful
      | Create New Custom Module |
    Given Navigation link is displayed
    When Click Navigation link
    Then Verify Navigation page is displayed
    When Click Credit Cards checkbox
    When Click Add to Menu button
    Then Verify Credit Cards is added to Menu Items
    When Attach icon to the menu item
    Then Verify icon is attached to the menu item
    When Click Save button
    Then Verify Credit Cards is added to navigation panel
  
  #Author - Sunil Nikam
   @Sanity
  Scenario: Create Credit Card record
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    When Navigate to page "/modules/credit_cards"
    Then Verify Credit Cards page is displayed
    When Click Add Credit Cards button
    Then Verify Create New Credit Card form is displayed
    When Add Credit Card details
      | Card_Number | CVV | Card_Type |
      | 19939921993 | 999 | Credit    |
    When Click on Save Button
    Then Verify record detail view is opened with title "999"
    Then Close Record Detail View
    Then Verify Credit Card record is created



  Scenario: Add Required By Condition constraint to a custom module field
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    When Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    Then Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click on Fields Editor
    When Click on Add Field Link
    When Add Card User Field
    Then Verify Save button is enabled
    Then Verify Publish button is disabled
    When Click Required By Condition radio button
    Then Verify Default Logical Operator AND is selected
    Then Verify Default Value for Field is selected
    When Select CVV field option
    Then Verify CVV textbox is visible
    When select Equals operator
    When Enter CVV value
    When Click on MMD Save Button
    Then Verify Save button is disabled
    Then Verify Publish button is enabled
    When Click on Publish button
    Then Verify Publish page is displayed
    Then Verify Publish button is disabled


  Scenario: Create Credit Card record to verify Required By Condition
    Given Verify execution of below scenarios is successful
      | Add Required By Condition constraint to a custom module field |
    When Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    When Click Add Credit Cards button
    Then Verify Create New Credit Card form is displayed
    When Add Credit Card details
      | Card_Number | CVV | Card_User       | Card_Type |
      | 123456789   | 998 | Automation_User | Debit     |
    Then Verify Card User is mandatory field
    When Click on Save Button
    Then Verify record detail view is opened with title "998"
    Then Close Record Detail View



  Scenario: Add Visible By Condition constraint to a custom module field
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    Then Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click on Fields Editor
    When Click on Add Field Link
    When Add Currency Field
    Then Verify Save button is enabled
    Then Verify Publish button is disabled
    When Click Visible By Condition radio button
    Then Verify Default Logical Operator AND is selected
    Then Verify Default Value for Field is selected
    When Select CVV field option
    Then Verify Edit CVV textbox is visible
    When select Equals operator
    When Enter CVV value for visibility condition
    When Click on MMD Save Button
    Then Verify Save button is disabled
    Then Verify Publish button is enabled
    When Click on Publish button
    Then Verify Publish page is displayed
    Then Verify Publish button is disabled


  Scenario: Create Credit Card record to verify Visibility Condition constraint
    Given Verify execution of below scenarios is successful
      | Add Visible By Condition constraint to a custom module field |
    When Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    When Click Add Credit Cards button
    Then Verify Create New Credit Card form is displayed
    Then Verify field is not displayed
      | Currency |
    When Add Credit Card details
      | Card_Number | CVV | Card_Type |
      | 963258741   | 996 | Debit     |
    Then Verify field is displayed
      | Currency |
    When Add Credit Card details
      | Currency |
      | USD      |
    When Click on Save Button
    Then Verify record detail view is opened with title "996"


  Scenario: Add Hidden constraint to a custom module field
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    Then Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click on Fields Editor
    When Click on Add Field Link
    When Add PIN_Number Field
    Then Verify Save button is enabled
    Then Verify Publish button is disabled
    Then Verify Visible radio button is selected
    When Click Hidden radio button
    When Click on MMD Save Button
    Then Verify Save button is disabled
    Then Verify Publish button is enabled
    When Click on Publish button
    Then Verify Publish page is displayed
    Then Verify Publish button is disabled
    Then Verify Credit Cards module selected
    When Click on Fields Editor
    Then Verify PIN_Number field is added to Fields list
    Then Verify Hidden icon is available on PIN_Number field row


  Scenario: Verify Hidden field is not displayed
    Given Verify execution of below scenarios is successful
      | Add Hidden constraint to a custom module field |
    Given Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    When Click Add Credit Cards button
    Then Verify Create New Credit Card form is displayed
    Then Verify field is not displayed
      | PIN Number |
    When Add Credit Card details
      | Card_Number | CVV | Card_Type |
      | 321456987   | 995 | Debit     |
    When Click on Save Button
    Then Verify record detail view is opened with title "995"
    Then Verify PIN Number field is not present in details view
    Then Close Record Detail View



  Scenario: Custom module Record creation for Trackable module
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    Then Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click Summary tab
    Then Verify Trackable checkbox is available
    Then Verify Trackable checkbox is checked
    When Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    When Click Hamburger Menu
    Then Verify column list is visible
    Then Verify Created By attribute is available
    When Click Add Credit Cards button
    Then Verify Create New Credit Card form is displayed
    When Add Credit Card details
      | Card_Number | CVV | Card_Type |
      | 147852369   | 992 | Debit     |
    When Click on Save Button
    Then Verify record detail view is opened with title "992"
    Then Verify Created By field is visible



  Scenario: Custom module Record creation for Non-Trackable Module
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    Then Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click Summary tab
    Then Verify Trackable checkbox is available
    When Click Trackable checkbox
    Then Verify Trackable checkbox is unchecked
    Then Verify Save button is enabled
    Then Verify Publish button is disabled
    When Click on MMD Save Button
    Then Verify Save button is disabled
    Then Verify Publish button is enabled
    When Click on Publish button
    Then Verify Publish page is displayed
    Then Verify Publish button is disabled
    Then Verify Trackable checkbox is unchecked
    When Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    When Click Hamburger Menu
    Then Verify column list is visible
    Then Verify Created By attribute is not available
    When Click Add Credit Cards button
    Then Verify Create New Credit Card form is displayed
    When Add Credit Card details
      | Card_Number | CVV | Card_Type |
      | 321456987   | 991 | Debit     |
    When Click on Save Button
    Then Verify record detail view is opened with title "991"
    Then Verify Created By field is not visible
    Then Close Record Detail View


  Scenario: Custom module Record creation for Taggable module
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    Then Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click Summary tab
    Then Verify Taggable checkbox is available
    Then Verify Taggable checkbox is checked
    When Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    When Click Hamburger Menu
    Then Verify column list is visible
    Then Verify Tags attribute is available
    When Click Add Credit Cards button
    Then Verify Create New Credit Card form is displayed
    Then Verify Tag field is visible
    When Add Credit Card details
      | Card_Number | CVV | Card_Type | Tags          |
      | 963258741   | 989 | Debit     | AutomationTag |
    When Click on Save Button
    Then Verify record detail view is opened with title "989"
    Then Verify Tag field is visible


  Scenario: Custom module Record creation for Non-Taggable Module
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    Then Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click Summary tab
    Then Verify Taggable checkbox is available
    When Click Taggable checkbox
    Then Verify Taggable checkbox is unchecked
    Then Verify Save button is enabled
    Then Verify Publish button is disabled
    When Click on MMD Save Button
    Then Verify Save button is disabled
    Then Verify Publish button is enabled
    When Click on Publish button
    Then Verify Publish page is displayed
    Then Verify Publish button is disabled
    Then Verify Taggable checkbox is unchecked
    When Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    When Click Hamburger Menu
    Then Verify column list is visible
    Then Verify Tags attribute is not available
    When Click Add Credit Cards button
    Then Verify Create New Credit Card form is displayed
    Then Verify Tag field is not visible
    When Add Credit Card details
      | Card_Number | CVV | Card_Type |
      | 147852369   | 994 | Debit     |
    When Click on Save Button
    Then Verify record detail view is opened with title "994"
    Then Verify Tag field is not visible
    Then Close Record Detail View


  Scenario: Custom module Record creation to verify uniqueness constraint
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Create below records for "credit_cards" module via api call
      | cardNumber | cVV  |
      | 407407     | 1997 |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    Then Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click Summary tab
    When Select CVV field for uniqueness
    Then Verify CVV is set as uniqueness constraint
    Then Verify Save button is enabled
    Then Verify Publish button is disabled
    When Click on MMD Save Button
    Then Verify Save button is disabled
    Then Verify Publish button is enabled
    When Click on Publish button
    Then Verify Publish page is displayed
    Then Verify Publish button is disabled
    Then Verify CVV is set as uniqueness constraint
    When Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    When Click Add Credit Cards button
    Then Verify Create New Credit Card form is displayed
    When Add Credit Card details
      | Card_Number | CVV  | Card_Type |
      | 147852369   | 1997 | Debit     |
    When Click button "Save"
    Then Verify Uniqueness Constraint violation message is displayed
    When Add Credit Card details
      | CVV  |
      | 1998 |
    When Click button "Save"
    Then Verify record detail view is opened with title "1998"


  Scenario: Custom module Record creation to verify display template
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    Then Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click Summary tab
    Then Update the Display Templete value
    Then Verify Save button is enabled
    Then Verify Publish button is disabled
    When Click on MMD Save Button
    Then Verify Save button is disabled
    Then Verify Publish button is enabled
    When Click on Publish button
    Then Verify Publish page is displayed
    Then Verify the Display Templete value
    When Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    When Click Add Credit Cards button
    Then Verify Create New Credit Card form is displayed
    When Add Credit Card details
      | Card_Number | CVV | Card_Type |
      | 321456987   | 990 | Debit     |
    When Click "Save" button
    Then Verify record detail view is opened with title "321456987"
    Then Close Record Detail View



  Scenario: Custom module Revert Field
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    Then Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click on Fields Editor
    And Click on Add Field Link
    And Enter "Expiry Date" in field "Field Title"
    And Click "Apply" button
    And Enter "Expiry Date" in filter field
    And Click on the field at row "1"
    And Enter "End Date" in field "Field Title"
    And Click Revert button
    Then Verify field "Field Title" value is "Expiry Date"


  Scenario: Custom module Revert to last saved
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    When User Scrolls to Top
    And Click "Save" button

    When Click on Add Field Link
    And Enter "Bank Name" in field "Field Title"
    And Click "Apply" button
    And Enter "Bank Name" in filter field
    And Click on the field at row "1"
    Then Verify field "Field Title" value is "Bank Name"
    When User Scrolls to Top
    When Click MMD Revert Dropdown
    When Click MMD Revert Option "Revert to last saved"
    Then verify Confirmation pop up comes
    When Click "Confirm" button
    And Enter "Bank Name" in filter field
    Then Verify "Bank Name" is not displayed under Fields
    When Enter "Card User" in filter field
    Then Verify "Card User" is displayed under Fields


  Scenario: Custom module Revert to last Published
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    When Click on Add Field Link
    And Enter "Branch Name" in field "Field Title"
    And Click "Apply" button
    When Click MMD Revert Dropdown
    When Click MMD Revert Option "Revert to last published"
    Then verify Confirmation pop up comes
    When Click "Confirm" button
    And Enter "Branch Name" in filter field
    Then Verify "Branch Name" is not displayed under Fields
    Then Verify Publish button is disabled
    When Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    When Click Add Credit Cards button
    Then Verify Create New Credit Card form is displayed
    When Add Credit Card details
      | Card_Number | CVV | Card_Type |
      | 741258963   | 112 | Debit     |
    #Adding wait before saving record detail
    And Wait for specified time
      | 2 |
    And Click "Save" button
    Then Verify record detail view is opened with title "741258963"



  Scenario: Custom module Add a new correlated Record
    # Add a related record from credit card record
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Create below records for "credit_cards" module via api call
      | cardNumber | cVV  |
      | 12345616   | 5616 |
    Given Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    When Filter grid column "CVV" by entering "5616" in column level search box filter
    And Verify correct record is fetched
      | ColumnName | Value |
      | CVV        | 5616  |
    When Click row "1" of grid
    Then Verify record detail view is opened with title "12345616"
    #When Click Alerts Tab
    And Click "Add" button
    Then Verify form pop up with title "Add New Alert" is displayed
    When Enter "Related Alert Record" in field "Name"
    And Verify "Create" Button is Enabled
    And Click "Create" button
    Then Verify Alert Form Pop Up is Closed
    And Filter grid column "Name" by entering "Related Alert Record" in column level search box filter
    And Verify in row 1 record, "Name" column value is "Related Alert Record"
    And Verify grid record count is "1"
    And Navigate to page "/modules/alerts"
    And Filter grid column "Name" by entering "Related Alert Record" in column level search box filter
    And Click row "1" of grid

    Then Verify record detail view is opened with title "Related Alert Record"
    When Click "Credit Cards" under "Correlations" tab of relationship widget
    And Filter grid column "Card Number" by entering "12345616" in column level search box filter
    Then Verify in row 1 record, "Card Number" column value is "12345616"


    #TODO - uncomment date field default value validation - open bug_id = 0892166
  Scenario: Custom module check default value for fields
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    And Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click on Fields Editor
    When Click on Add Field Link
    And Enter "Owner Name" in field "Field Title"
    And Enter "Test User" in field "Default Value"
    And Click "Apply" button
    When Click on Add Field Link
    And Set select type dropdown field "Sub Type" to "IPv4"
    And Enter "Bank IP" in field "Field Title"
    And Enter "10.10.10.10" in field "Default Value"
    And Click "Apply" button
    When Click on Add Field Link
    And Set select type dropdown field "Field Type" to "Checkbox"
    And Enter "Is Active" in field "Field Title"
    And "Select" checkbox "Default Value"
    And Click "Apply" button
    When Click on Add Field Link
    And Set select type dropdown field "Field Type" to "Picklist"
    And Set select type dropdown field "Picklist" to "Industry"
    And Enter "Owner Job Industry" in field "Field Title"
    And Set lookup type dropdown field "Default Value" to "Banking"
    And Click "Apply" button
#    When Click on Add Field Link
#    And Set select type dropdown field "Field Type" to "Datetime"
#    And Enter "Transaction Date" in field "Field Title"
#    When Set date field "Default Value" as "Today"
#    #save selected date for future reference
#    And Save selected date from field "Default Value" to "Default_date"
#    And Click "Apply" button
#    And User Scrolls to Top
    And Click "Save" button
    And Wait until publish button is enabled
    And Click on Publish button
    Then Verify Publish page is displayed
    Then Verify Publish button is disabled
    Given Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    When Click Add Credit Cards button
    Then Verify Create New Credit Card form is displayed
    #verify default values are displayed in form view
    Then Verify form element values
      | Label              | Type     | Expected Value |
      | Owner Name         | text     | Test User      |
      | Bank IP            | text     | 10.10.10.10    |
      | Is Active          | checkbox | Selected       |
      | Owner Job Industry | lookup   | Banking        |
     # | Transaction Date   | date     | Default_Date   |
    When Enter "987123" in field "Card Number"
    And Enter "123789" in field "CVV"
    And Enter "Auto Card User" in field "Owner Name"
    And Enter "11.11.11.11" in field "Bank IP"
    And "Unselect" checkbox "Is Active"
    And Set lookup type dropdown field "Owner Job Industry" to "Agriculture"
    #And Clear date field "Transaction Date"
    #Adding wait before saving record detail
    And Wait for specified time
      | 2 |
    And Click "Save" button
    Then Verify record detail view is opened with title "987123"
    #Verify default values are overrridden after saving
    And Verify value of "Owner Name" on Record Detail as "Auto Card User"
    And Verify value of "Bank IP" on Record Detail as "11.11.11.11"
    And Verify value of "Owner Job Industry" on Record Detail as "Agriculture"
    #And Verify value of "Transaction Date" on Record Detail as "Select Date"

  @Open_Bug #0898895
  Scenario: Custom Module Encrypted field is not searchable
    Given Verify execution of below scenarios is successful
      | Custom module check default value for fields |
    Given Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    When Click Add Credit Cards button
    When Enter "6878" in field "Card Number"
    And Enter "6879" in field "CVV"
    And Enter "Test_Owner_01" in field "Owner Name"
    #add wait before saving the record
    And Wait for specified time
      | 2 |
    And Click "Save" button
    Then Verify record detail view is opened with title "6878"
    And Close Record Detail View
    #wait for record to be avialable for global search
    And Wait for specified time
      | 4 |
    When Enter "Test_Owner_01" in global search
    And Verify searched record is "displayed" on global search page
      | Module Name | Field Name | Value         |
      | CreditCard  | Owner Name | Test_Owner_01 |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    And Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click on Fields Editor
    And Enter "Owner Name" in filter field
    And Click on the field at row "1"
    And "Select" checkbox "Encrypted"
    And Click "Apply" button
    And User Scrolls to Top
    And Click "Save" button
    And Wait until publish button is enabled
    And Click on Publish button
    Then Verify Publish page is displayed
    Then Verify Publish button is disabled
    #wait for record to be avialable for global search
    And Wait for specified time
      | 4 |
    When Enter "Test_Owner_01" in global search
    And Verify searched record is "not displayed" on global search page
      | Module Name | Field Name | Value         |
      | CreditCard  | Owner Name | Test_Owner_01 |


  Scenario: Custom module json field validation
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    And Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click on Fields Editor
    And Click on Add Field Link
    And Set select type dropdown field "Field Type" to "JSON"
    And Enter "JSON Field" in field "Field Title"
    And Click "Apply" button
    And User Scrolls to Top
    And Click "Save" button
    And Wait until publish button is enabled
    And Click on Publish button
    Then Verify Publish page is displayed
    Then Verify Publish button is disabled
    And Navigate to page "/modules/credit_cards/add"
    When Enter "500001" in field "Card Number"
    And Enter "502" in field "CVV"
    And Enter below json string in field "JSON Field"
      | { "Bank_Name":"HDFC","Bank_Location":"Pune" } |
      #add wait before saving the record
    And Wait for specified time
      | 2 |
    And Click "Save" button
    And Verify record detail has json field "JSON Field" with below value
      | { "Bank_Name":"HDFC","Bank_Location":"Pune" } |


  Scenario: Custom module many to one field validation
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Navigate to page "/editor/Master/modules/"
    #add hunt as many to one field
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    And Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click on Fields Editor
    And Click on Add Field Link
    And Set select type dropdown field "Field Type" to "Many to One"
    And Set select type dropdown field "Related Module" to "Hunts"
    And Enter "Related Hunts" in field "Field Title"
    And Click "Apply" button
    And User Scrolls to Top
    And Click "Save" button
    And Wait until publish button is enabled
    #add credit card as lookup field in hunt modules
    When Set select type dropdown field "Select a module to edit" to "Hunts"
    When Click on Fields Editor
    And Click on Add Field Link
    And Set select type dropdown field "Field Type" to "Lookup (One to Many or One to One)"
    And Set select type dropdown field "Related Module" to "Credit Cards"
    And Enter "Credit Cards" in field "Field Title"
    And Click "Apply" button
    And User Scrolls to Top
    And Click "Save" button
    And Wait until publish button is enabled
    #publish module
    And Click on Publish button
    Then Verify Publish page is displayed
    Then Verify Publish button is disabled
    When Navigate to page "/modules/credit_cards/add"
    And Enter "600001" in field "Card Number"
    And Enter "602" in field "CVV"
    And Wait for specified time
      | 2 |
    And Click "Save" button
    Then Verify record detail view is opened with title "600001"
    When Create below records for "hunt" module via api call
      | name                      | huntStart  | timeCreated |
      | Hunt for many to one test | 1675794600 | 1675794600  |
    When Click "Related Hunts" under "Related Records" tab of relationship widget
    And Click visible button "Link"
    And Verify visible text
      | Text Type     | Text to Search | Tag |
      | Pop Up Header | Link Hunts     | h3  |
    When Click grid hamburger menu
    And Select grid hamburger option "Name"
    And Filter grid column "Name" by entering "Hunt for many to one test" in column level search box filter
    And Select record no "1" from grid
    And Click button "Save Relationship"
    #wait until hunt is linked
    And Wait for specified time
      | 2 |
    When Click grid hamburger menu
    And Select grid hamburger option "Name"
    And Filter grid column "Name" by entering "Hunt for many to one test" in column level search box filter
    Then Verify below grid records are present on grid
      | Name                      |
      | Hunt for many to one test |


  Scenario: Add Required constraint to a custom module field
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    Then Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click on Fields Editor
    When Click on Add Field Link
    When Add Cash Limit Field
    Then Verify Save button is enabled
    Then Verify Publish button is disabled
    When Click Required radio button
    When Click on MMD Save Button
    Then Verify Save button is disabled
    Then Verify Publish button is enabled
    When Click on Publish button
    Then Verify Publish page is displayed
    Then Verify Publish button is disabled


  Scenario: Create Credit Card record to verify Required field
    Given Verify execution of below scenarios is successful
      | Add Required constraint to a custom module field |
    When Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    When Click Add Credit Cards button
    Then Verify Create New Credit Card form is displayed
    When Add Credit Card details
      | Card_Number | CVV | Card_User       | Card_Type |
      | 147852369   | 997 | Automation_User | Debit     |
    When Click on Save Button
    Then Verify record is not saved
    Then Verify Cash Limit is mandatory field
    When Add Credit Card details
      | Cash_Limit |
      | 50000      |
    And Wait for specified time
      | 2 |
    When Click button "Save"
    Then Verify record detail view is opened with title "147852369"


  Scenario: Custom module Edit Field
    Given Verify execution of below scenarios is successful
      | Add Required constraint to a custom module field |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    Then Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    And Click on Fields Editor
    And Enter "Cash Limit" in filter field
    And Click on the field at row "1"
    Then Verify field "Field Title" value is "Cash Limit"
    And Enter "Cash Limit Updated" in field "Field Title"
    And Click "Apply" button
    And User Scrolls to Top
    And Click "Save" button
    And Wait until publish button is enabled
    And Click on Publish button
    Then Verify Publish page is displayed
    And Click on Fields Editor
    And Enter "Cash Limit Updated" in filter field
    And Click on the field at row "1"
    Then Verify field "Field Title" value is "Cash Limit Updated"
    When Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    When Click Add Credit Cards button
    Then Verify Create New Credit Card form is displayed
    When Add Credit Card details
      | Card_Number | CVV | Card_Type | Cash_Limit_Updated |
      | 987412365   | 111 | Debit     | 10000              |
    And Click "Save" button
    Then Verify record detail view is opened with title "987412365"
    And Verify value of "Cash Limit Updated" on Record Detail as "10000"
    When Close Record Detail View
    Then Verify value of "Cash Limit Updated" is Present on Grid View


  Scenario: Custom module Remove Field
    Given Verify execution of below scenarios is successful
      | Custom module Edit Field |
    #Delete Newly Added Field
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    And Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click on Fields Editor
    And Enter "Cash Limit Updated" in filter field
    And Click on the field at row "1"
    And Click Remove button on MMD editor page
    Then verify Confirmation pop up comes
    When Click "Confirm" button
    When User Scrolls to Top
    And Click "Save" button
    And Wait until publish button is enabled
    And Click on Publish button
    Then Verify Publish page is displayed
    And Verify Publish button is disabled
    When Click on Fields Editor
    And Enter "Cash Limit Updated" in filter field
    Then Verify "Cash Limit Updated" is not displayed under Fields
    #Navigate Back to Record Detail To check if field is deleted
    When Navigate to page "/modules/credit_cards"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page Header | Credit Cards   | span |
    Then Verify "Cash Limit Updated" is not present in column header
    #check if newly created Record is intact
    When Filter grid column "CVV" by entering "112" in column level search box filter
    And Verify correct record is fetched
      | ColumnName | Value |
      | CVV        | 112   |
    When Click row "1" of grid
    Then Verify record detail view is opened with title "741258963"
    Then Verify "Cash Limit Updated" is not present in create record form view


  Scenario: Verify Custom Module audit log
    Given Verify execution of below scenarios is successful
      | Custom module Remove Field |
    Given Navigate to page "/system/audit-log"
    Then Audit Log is displayed
    When Set select type dropdown field "Record Type" to "Credit Cards"
    And Set grid pagination count to "100"
    Then Verify below grid records are present on grid
      | Title                                                              | Record Type | Operation | User     |
      | Schema [Credit Card] created                                       | Credit Card | Create    | CS Admin |
      | Schema [Credit Card] updated with attribute(s) [alerts] created    | Credit Card | Update    | CS Admin |
      | Schema [Credit Card] updated with attribute(s) [cashLimit] updated | Credit Card | Update    | CS Admin |
      | Schema [Credit Card] updated with attribute(s) [cashLimit] deleted | Credit Card | Update    | CS Admin |

  @Open_Bug #0924492
  Scenario: Custom Module add multiSelectPicklist field
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    And Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click on Fields Editor
    And Click on Add Field Link
    And Set select type dropdown field "Field Type" to "Multiselect Picklist"
    And Set select type dropdown field "Picklist" to "AssetState"
    And Click "checkbox" "Configure_Picklist_Item_Visibility" on "MMD editor - Add Field page" using locator type "id"
    And Select option "Conditionally Visible" in the dropdown "Picklist_Visibility_For_First_Option" on "MMD editor - Add Field page"
    And Add condition for condition group number "1" from condition row set "1" with below filter criteria
      | Field     | Operator | Value         |
      | Card User | Contains | Inactive_Card |
    And Enter "Card Status" in field "Field Title"
    And Click "Apply" button
    And User Scrolls to Top
    And Click "Save" button
    And Wait until publish button is enabled
    And Click on Publish button
    Then Verify Publish page is displayed
    And Verify Publish button is disabled
    And Navigate to page "modules/credit_cards"
    And Click button "Add"
    Then Below options are available in the multiSelect dropdown "Card Status"
      | Active   |
      | Isolated |
    When Enter "Inactive_Card_User" in field "Card User"
    Then Below options are available in the multiSelect dropdown "Card Status"
      | Active   |
      | Isolated |
      | Inactive |
    When Select below options in multiSelect dropdown "Card Status"
      | Inactive |
      | Isolated |
    And Enter "992299" in field "Card Number" nm jm mkjj
    And Click button "Save"
    And Verify record detail view is opened with title "992299"
    And Verify value of "Card Status" on Record Detail as "Inactive"
    And Verify value of "Card Status" on Record Detail as "Isolated"

  Scenario: Custom module add lookup field
    Given Verify execution of below scenarios is successful
      | Assign Permissions on Credit Card |
    Given Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    And Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click on Fields Editor
    And Click on Add Field Link
    And Set select type dropdown field "Field Type" to "Lookup (One to Many or One to One)"
    And Set select type dropdown field "Related Module" to "People"
    And Enter "Card Bank Manager" in field "Field Title"
    And Click button "Apply"
    And User Scrolls to Top
    And Click button "Save"
    And Wait until publish button is enabled
    And Click on Publish button
    Then Verify Publish page is displayed
    And Verify Publish button is disabled
    And Navigate to page "modules/credit_cards"
    And Click button "Add"
    And Set lookup type dropdown field "Card Bank Manager" to "MS Dhoni"
    And Enter "10291" in field "Card Number"
    And Click button "Save"
    And Verify record detail view is opened with title "10291"
    And Verify value of "Card Bank Manager" on Record Detail as "MS Dhoni"
    #And Select checkbox "CheckBox"
  #And Verify "<string>" dropdown value is "<string>"  not required


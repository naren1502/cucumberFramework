@Regression
Feature: Picklist

   @Sanity
  Scenario: Create New Picklist
    When Click Setting Button
    Then Verify Picklist link is displayed
    When Click Picklists link
    Then Verify Create new picklist is selected
    Then Verify Save button is disabled
    When Enter picklist title
      | Auto_Picklist_Colour |
    Then Verify Save button is enabled
    When Enter picklist items
      | White |
      | Black |
      | Red   |
    Then Verify item is added to the picklist
      | White |
      | Black |
      | Red   |
    When Click Save button
    Then Verify toaster message appears
      | Auto_Picklist_Colour saved. |
    Then Verify Remove Picklist button is enabled


  Scenario: Change The Order Of The Items
    Given Verify execution of below scenarios is successful
      | Create New Picklist |
    Given Auto_Picklist_Colour picklist is selected
    When Ascending Sort button is displayed
    Then Verify picklist items order
      | White |
      | Black |
      | Red   |
    When Click Ascending Sort button
    Then Verify Revert Order link is displayed
    Then Verify Save button is enabled
    When Click Save button
    Then Verify Picklist is saved
    Then Verify picklist items order
      | Black |
      | Red   |
      | White |


  Scenario: Delete Item
    Given Verify execution of below scenarios is successful
      | Create New Picklist |
    Given Auto_Picklist_Colour picklist is selected
    When Verify item is added to the picklist
      | Red |
    When Click Delete picklist item button
      | Red |
    Then Delete confirmation dialogue is displayed
    When Clicked on Confirm button
    Then Verify picklist item is removed from the picklist
      | Red |
    When Click Save button
    Then Verify Picklist is saved


  Scenario: Remove All Items
    Given Verify execution of below scenarios is successful
      | Create New Picklist |
    Given Auto_Picklist_Colour picklist is selected
    When Remove All Items button is enabled
    When Click Remove All Items button
    Then Delete confirmation dialogue is displayed
    When Clicked on Confirm button
    Then Verify picklist gets empty
    Then Verify Save button is enabled
    When Click Save button
    Then Verify Picklist is saved


  Scenario: Remove Picklist
    Given Verify execution of below scenarios is successful
      | Create New Picklist |
    Given Auto_Picklist_Colour picklist is selected
    When Verify Remove Picklist button is enabled
    When Click Remove Picklist button
    Then Delete confirmation dialogue is displayed
    When Clicked on Confirm button
    Then Verify delete picklist toaster message appears
      | Auto_Picklist_Colour |
    Then Verify picklist is deleted
      | Auto_Picklist_Colour |


  Scenario: Create Duplicate Picklist
    Given Verify execution of below scenarios is successful
      | Create New Custom Module |
    Given Navigate to page "/editor/picklists/"
    Given Verify Create new picklist is selected
    When Enter picklist title
      | CardType |
    Then Verify Save button is enabled
    When Click Save button
    Then Verify Error toaster message is displayed
      | CardType |


  Scenario: Delete Used Picklist
    Given Verify execution of below scenarios is successful
      | Create New Custom Module |
    When Navigate to page "/editor/picklists/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Picklists      | h1  |
    When Select the picklist
      | CardType |
    Then Verify the picklist is selected
      | CardType |
    When Verify Remove Picklist button is enabled
    When Click Remove Picklist button
    Then Delete confirmation dialogue is displayed
    When Clicked on Confirm button
    Then Verify Cannot Delete Picklist dialogue is displayed
    When Click OK Button
    Then Verify the picklist is selected
      | CardType |
    When Navigate to page "/editor/Master/modules/"
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page Header | Modules        | h1  |
    Then Verify Create New Module is selected
    When Select Credit Cards module
    Then Verify Credit Cards module selected
    When Click on Fields Editor
    Then Verify Card Type field is available
    When Click Card Type field
    Then Verify Card Type field form is displayed
    When Remove button is enabled
    Then Click Remove button
    Then Delete confirmation dialogue is displayed
    When Clicked on Confirm button
    Then Verify Card Type field is not available
    Then Verify Save button is enabled
    When Click on MMD Save Button
    Then Verify Save button is disabled
    Then Verify Publish button is enabled
    When Click on Publish button
    Then Verify Publish page is displayed
    Then Verify Publish button is disabled
    Then Verify Picklist link is displayed
    When Click Picklists link
    Then Verify Create new picklist is selected
    When Select the picklist
      | CardType |
    Then Verify the picklist is selected
      | CardType |
    When Verify Remove Picklist button is enabled
    When Click Remove Picklist button
    Then Delete confirmation dialogue is displayed
    When Clicked on Confirm button
    Then Verify delete picklist toaster message appears
      | CardType |
    Then Verify picklist is deleted
      | CardType |

  	

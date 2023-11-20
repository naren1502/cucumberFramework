@Regression
Feature: Collaboration Panel


  Scenario: Verify Add Comment to Record
    #Navigate to Indicator
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
    #Verify Indicator is present with csadmin user
    When Click Add record button
    Then Verify Visible text
      | Text Type   | Text to Search       | Tag |
      | Form Header | Create New Indicator | h3  |
    When Enter "Test Indicator For Comments Verification" in field "Value"
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "Test Indicator For Comments Verification". |
    Then Verify record detail view is opened with title "Test Indicator For Comments Verification"
    #Add comment to Indicator record
    When Click on Collaboration panel
    Then Verify Visible text
      | Text Type                        | Text to Search | Tag |
      | Collaboration Panel Comments Tab | Comments       | a   |
    When Click "Comments" link
    Then Verify Visible text
      | Tag    | Text to Search | Tag    |
      | Button | New Comment    | button |
    When Click on Add new comment
    When Add comment "@Dhoni"
    When Add comment " Please check this record"
    When Add Tag "uiauto"
    When Click Send Comment
    #verify Comment
    Then Verify "@MS Dhoni Please check this record" comment is visible in collaboration panel
    #Verify Tag
    Then Verify Visible text
      | Text Type | Text to Search | Tag  |
      | Tag       | uiauto         | span |


  Scenario: Verify Edit comment
    Given Verify execution of below scenarios is successful
      | Verify Add Comment to Record |
    When Click Edit Comment
    When Clear comment text
    When Add comment "@Dhoni"
    When Add comment " Comment Updated from automation"
    When Add Tag "uiautoTag2"
    When Click Send Comment
    Then Verify "@MS Dhoni Comment Updated from automation" comment is visible in collaboration panel
    Then Verify Visible text
      | Text Type | Text to Search | Tag  |
      | Tag       | uiautoTag2     | span |
    Then Verify Visible text
      | Text Type | Text to Search | Tag  |
      | Tag       | uiauto         | span |


  Scenario: Verify comment can be mark as important
    Given Verify execution of below scenarios is successful
      | Verify Add Comment to Record |
    When Mark comment as important
    Then Verify comment is marked important


  Scenario: Verify user can delete the comment as the soft delete
    Given Verify execution of below scenarios is successful
      | Verify Add Comment to Record |
    #Navigate to setting page to alter the comment delete setting
    When Navigate to page "/system/system-configuration/application-configuration"
    Then Verify Visible text
      | Text Type | Text to Search            | Tag |
      | Link      | Application Configuration | a   |
    Then Verify soft delete comment is enabled
    #Navigate to Indicator
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
    #Verify Indicator is present with csadmin user
    When Filter grid column "Value" by entering "Test Indicator For Comments Verification" in column level search box filter
    And Verify correct record is fetched
      | ColumnName | Value                                    |
      | Value      | Test Indicator For Comments Verification |
    #Open Indicator record and add comment
    When Click grid cell with text "Test Indicator For Comments Verification"
    Then Verify Visible text
      | Text Type    | Text to Search                           | Tag |
      | Record Title | Test Indicator For Comments Verification | p   |
    #Add comment to Indicator record
    When Click on Collaboration panel
    Then Verify Visible text
      | Text Type                        | Text to Search | Tag |
      | Collaboration Panel Comments Tab | Comments       | a   |
    When Click "Comments" link
    Then Verify Visible text
      | Tag    | Text to Search | Tag    |
      | Button | New Comment    | button |
    When Click on Add new comment
    When Add comment "Comment added to test Soft Delete of Comment"
    When Click Send Comment
    When Delete Comment "Comment added to test Soft Delete of Comment"
    When Click "Confirm" button
    Then Verify toaster message appears
      | Comment successfully deleted. |
    Then Verify number of visible comments is 2
    Then Verify comment is deleted as soft delete


  Scenario: Verify user can delete comment permenantly
    Given Verify execution of below scenarios is successful
      | Verify Add Comment to Record |
    #Navigate to setting page to alter the comment delete setting
    When Navigate to page "/system/system-configuration/application-configuration"
    Then Verify Visible text
      | Text Type | Text to Search            | Tag |
      | Link      | Application Configuration | a   |
    When Enable hard delete comment    
    #Navigate to Indicator
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
    #Verify Indicator is present with csadmin user
    When Filter grid column "Value" by entering "Test Indicator For Comments Verification" in column level search box filter
    And Verify correct record is fetched
      | ColumnName | Value                                    |
      | Value      | Test Indicator For Comments Verification |
    #Open Indicator record and add comment
    When Click grid cell with text "Test Indicator For Comments Verification"
    Then Verify Visible text
      | Text Type    | Text to Search                           | Tag |
      | Record Title | Test Indicator For Comments Verification | p   |
    #Add comment to Indicator record
    When Click on Collaboration panel
    Then Verify Visible text
      | Text Type                        | Text to Search | Tag |
      | Collaboration Panel Comments Tab | Comments       | a   |
    When Click "Comments" link
    Then Verify Visible text
      | Tag    | Text to Search | Tag    |
      | Button | New Comment    | button |
    When Click on Add new comment
    When Add comment "Comment Added to test hard delete"
    When Click Send Comment
    When Delete Comment "Comment Added to test hard delete"
    When Click "Confirm" button
    Then Verify toaster message appears
      | Comment successfully deleted. |
    Then Verify number of visible comments is 2


  Scenario: Verify user can change the modify/delete comment time to 1 Minutes
    #Navigate to setting page to alter the comment delete setting
    When Navigate to page "/system/system-configuration/application-configuration"
    Then Verify Visible text
      | Text Type | Text to Search            | Tag |
      | Link      | Application Configuration | a   |
    When Set comment modification time to "1 Minute"


  Scenario: Verify MS Dhoni user can reply to the comment
    Given Verify execution of below scenarios is successful
      | Run Import Template |
    Given Navigate to page "/logout"
    And Login to FortiSOAR
      | Username | Password  |
      | msd      | Demo@1234 |
    #Navigate to Indicator
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
    #Verify Indicator is present with csadmin user
    When Filter grid column "Value" by entering "Test Indicator For Comments Verification" in column level search box filter
    And Verify correct record is fetched
      | ColumnName | Value                                    |
      | Value      | Test Indicator For Comments Verification |
    When Click grid cell with text "Test Indicator For Comments Verification"
    Then Verify record detail view is opened with title "Test Indicator For Comments Verification"
    #Add comment to Indicator record
    When Click on Collaboration panel
    Then Verify Visible text
      | Text Type                        | Text to Search | Tag |
      | Collaboration Panel Comments Tab | Comments       | a   |
    When Click "Comments" link
    Then Verify Visible text
      | Tag    | Text to Search | Tag    |
      | Button | New Comment    | button |
    When Click Reply button
    When Add comment " Acknowledged to comment"
    When Click Send Comment
    Then Verify "Acknowledged to comment" reply comment is visible in collaboration panel


  Scenario: Verify user can add attachments in the comment
    Given Verify execution of below scenarios is successful
      | Verify MS Dhoni user can reply to the comment |
    When Click on Add new comment

    When Add comment "In comment attachment is added, please refer it"

    When Select Attachment

    When Click Send Comment
    #Verify attachment is present in the comment
    Then Verify number of visible comments is 3
    Then confirm "EnvironmentVariables.properties" file is attached
    Then Verify comment is editable "In comment attachment is added, please refer it"


  Scenario: Verify user can filter comments in that user is tagged
    Given Verify execution of below scenarios is successful
      | Verify user can add attachments in the comment |
  	#Apply tagged filter
    When Click tagged filter
    Then Verify tagged filter is applied
    Then Verify number of visible comments is 1
    Then Verify "@MS Dhoni Comment Updated from automation" comment is visible in collaboration panel
    #Remove the applied filter
    When Click tagged filter
    Then Verify number of visible comments is 3


  Scenario: Verify user can filter comments that are marked as important
    Given Verify execution of below scenarios is successful
      | Verify user can filter comments in that user is tagged |
    #If there is any applied filter remove it
    When Clear applied filter
    When Apply marked important filter
    Then Verify number of visible comments is 1
    Then Verify "@MS Dhoni Comment Updated from automation" comment is visible in collaboration panel
    #Remove the applied filter
    When Apply marked important filter
    Then Verify number of visible comments is 3


  Scenario: Verify user can apply filter by tags
    Given Verify execution of below scenarios is successful
      | Verify user can filter comments that are marked as important |
    #If there is any applied filter remove it
    When Clear applied filter
    #Apply filter tag
    When Add filter tag "uiauto"

    Then Verify number of visible comments is 1
    Then Verify "@MS Dhoni Comment Updated from automation" comment is visible in collaboration panel
    When Remove applied tag filter


  Scenario: Verify Comment modification time lapse and user should not be able to edit comment after 1min
    Given Verify execution of below scenarios is successful
      | Verify user can filter comments that are marked as important |
		#Wait till comment time increased by 1min

    Then Verify for comment "In comment attachment is added, please refer it" edit button is disabled

